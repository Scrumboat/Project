#encoding: utf-8
class PaymentsController < ApplicationController
  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
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
