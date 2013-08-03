class InvoicesController < ApplicationController
  # GET /invoices
  # GET /invoices.json
  def index
    #@invoices = Invoice.all
    @invoices = Invoice.search(params[:search])
    if params[:create]
      Invoice.createInvoices()
      flash[:notice] = "Laskut luotu kaikille."
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
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.json
  def new
    @invoice = Invoice.new
    
    #@members_in_json = Invoice.select(:viitenumero).to_json
    #@viitenumerot = Invoice.select(:viitenumero)
    @laskut = Invoice.all
    @taulu = []
    @laskut.each do |lasku|
      @taulu.push(lasku.viitenumero)
    end

    #@members_in_json = Member.all.to_json
    #@members_in_json = '1000'
    #@invoice.viitenumero = '7777'
    #@invoice.save
    #member = Invoice.find(params[:jno])
    #@laskut = Invoice.find_all_by_jno(member.Jno)
    #@testi = :id
    #member = Member.find_all_by_Jno(params[:invoice][:jno]).first
    #@invoice.member_id = member.id

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
