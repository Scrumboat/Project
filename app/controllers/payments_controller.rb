#encoding: utf-8
class PaymentsController < ApplicationController

  # GET /payments/survey
  def survey_index
    @payments = Payment.where(:need_survey => true)

    respond_to do |format|
      format.html #survey_index.html.erb
    end
  end

  # GET /payments/:id/survey
  def survey
    @payment = Payment.find(params[:id])
    @member = Member.find_by_viitenumero(@payment.ref_number)
    @invoices = @member.invoices unless @member.nil?
    respond_to do |format|
      format.html  #survey.html.erb
    end
  end

  # POST /payments/:id/survey
  def survey_done
    payment = Payment.find(params[:id])
    invoice = Invoice.find(params[:invoice])

    payment.invoice_id = invoice.id
    payment.save
    if invoice.payments.sum(:amount) == invoice.summa
      invoice.maksettu = true
    elsif invoice.payments.sum(:amount) > invoice.summa
      #TODO: memberille ylijäämät
      invoice.maksettu = true
      money_to_member = invoice.viitesuoritukset - invoice.summa
      member = Member.find(invoice.member.id)
      # mihis kirjataan memberin ylimaksamat jutut?
      flash[:notice] = 'Laskun summa ylittyi. Meni limboon.'
    end
    payment.need_survey = false
    payment.save
    invoice.save
    member.save unless member.nil?

    respond_to do |format|
      format.html { redirect_to '/payments/survey'}
    end

  end

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.where(:invoice_id => params[:invoice_id])
    @invoice = Invoice.find(params[:invoice_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments }
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    @payment = Payment.find(params[:id])
    @invoice = Invoice.find(params[:invoice_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/new
  # GET /payments/new.json
  def new
    @payment = Payment.new
    @invoice = Invoice.find(params[:invoice_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
    @invoice = Invoice.find(params[:invoice_id])
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(params[:payment])
    @invoice = Invoice.find(params[:invoice_id])
    @payment.invoice_id = params[:invoice_id]
    if @payment.amount == @invoice.amount_left_to_pay then
      @invoice.maksettu = true
    else
      if @invoice.payments.sum(:amount) + @payment.amount == @invoice.summa
        @invoice.maksettu = true
      elsif @invoice.payments.sum(:amount) + @payment.amount > @invoice.summa
        flash[:notice] = 'MAKSOIT LIIKAA! HÄHÄHÄHÄÄ! RAHASI MENIVÄT LIMBOON!'
        @invoice.maksettu = true
      end

    end

    @invoice.save
    respond_to do |format|
      if @payment.save
        format.html { redirect_to invoice_payments_url(@invoice), notice: 'Payment was successfully created.' }
        format.json { render json: @payment, status: :created, location: @payment }
      else
        format.html { render action: "new" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payments/1
  # PUT /payments/1.json
  def update
    @payment = Payment.find(params[:id])
    @invoice = Invoice.find(params[:invoice_id])

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to invoice_payments_path(@invoice), notice: 'Suorituksen päivitys onnistuis.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    @invoice = Invoice.find(params[:invoice_id])

    respond_to do |format|
      format.html { redirect_to invoice_payments_url(@invoice) }
      format.json { head :no_content }
    end
  end
end
