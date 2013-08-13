#encoding: utf-8

class InvoicesController < ApplicationController

  # POST /invoices/uploadFile
  def uploadFile
    if params[:Viitesuoritustiedosto].blank?
      flash[:error] = 'Ei tiedostoa'
    else
      flash[:notice] = 'Viitesuoritukset (toivottavasti) purettu.'
      data_array = InvoicesHelper.parse_ref_numbers_from_file params[:Viitesuoritustiedosto]
      data_array.each do |payment|
        payment_processed = false
        member = Member.find_by_viitenumero(payment[:ref_number])
        if member.nil?
          Payment.create(invoice_id: nil, payment_date: payment[:payment_date], amount: payment[:amount], ref_number: payment[:ref_number], need_survey: true, raw_data: payment[:raw_data])
          flash[:alert] = 'Löytyi selvitystä vaativia suorituksia.'
          payment_processed = true
        else
          member.invoices do |invoice|
            if invoice.amount_left_to_pay == (payment[:amount]) && !invoice.maksettu
              invoice.maksettu = true
              #invoice.viitesuoritukset = payment[:amount]
              invoice.save
              Payment.create(invoice_id: invoice.id, payment_date: payment[:payment_date], amount: payment[:amount], ref_number: payment[:ref_number], need_survey: false, raw_data: payment[:raw_data])
              #attr_accessible :payment_date, :amount, :ref_number, :id, :need_survey, :invoice_id, :raw_data
              payment_processed = true
              break # löydettiin 'sopiva' lasku ja se merkattiin maksetuksi. ei enempää.
            end
          end
        end
        unless payment_processed
          Payment.create(invoice_id: nil, payment_date: payment[:payment_date], amount: payment[:amount], ref_number: payment[:ref_number], need_survey: true, raw_data: payment[:raw_data])
          flash[:alert] = 'Löytyi selvitystä vaativia suorituksia.'
        end

      end
    end

    redirect_to invoices_url

  rescue Exception => e
    flash[:error] = 'Virhe suorituksia purkaessa: ' + e.message
    logger.fatal e.backtrace.inspect
    redirect_to invoices_url
  end


  # GET /invoices
  # GET /invoices.json
  def index
    #@invoices = Invoice.all
    #listataan defaulttina maksamattomat!
    if params[:search].blank? then params[:search] = 'unpaid' end
    @invoices = Invoice.search(params[:search])
    if params[:create]
      if params[:tunniste].blank?
        flash[:error] = 'Lisää laskulle tunniste!'
        redirect_to invoices_url
        return
      end
      Invoice.createInvoices(params[:tunniste])
      flash[:notice] = "Laskut luotu kaikille tunnisteella:  #{params[:tunniste]}."
      redirect_to invoices_url
      return
    end
	if params[:karhu]
      Invoice.karhu()
      flash[:notice] = "Karhukirjeet luotu"
      redirect_to invoices_url
      return
    end
	if params[:sposti]
      Invoice.laskuta()
      flash[:notice] = "Laskut lähetetty!"
      redirect_to invoices_url
      return
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invoices }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
	  format.pdf do
        pdf = InvoicePdf.new(@invoice)
        send_data pdf.render, filename: 
        #"invoice_#{@invoice.nimi}#{@invoice.created_at.strftime("%d/%m/%Y")}.pdf",
		"Lasku_#{@invoice.nimi}.pdf",
        type: "application/pdf",
		disposition: "inline"
      end
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.json
  def new
    @invoice = Invoice.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(params[:invoice])
    member = Member.find_all_by_Jno(params[:invoice][:jno]).first
    @invoice.member_id = member.id
    @invoice.viitenumero = member.viitenumero
    #TODO: Laske laskulle summa
    #@invoice.summa =

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render json: @invoice, status: :created, location: @invoice }
      else
        format.html { render action: "new" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.json
  def update
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end
end
