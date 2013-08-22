class GuardturnsController < ApplicationController
  # GET /guardturns
  # GET /guardturns.json
  def index
    @guardturns = Guardturn.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guardturns }
    end
  end

  # GET /guardturns/1
  # GET /guardturns/1.json
  def show
    @guardturn = Guardturn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @guardturn }
    end
  end

  # GET /guardturns/new
  # GET /guardturns/new.json
  def new
    @guardturn = Guardturn.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @guardturn }
    end
  end

  # GET /guardturns/1/edit
  def edit
    @guardturn = Guardturn.find(params[:id])
  end

  # POST /guardturns
  # POST /guardturns.json
  def create
    @guardturn = Guardturn.new(params[:guardturn])

    respond_to do |format|
      if @guardturn.save
        format.html { redirect_to @guardturn, notice: 'Guardturn was successfully created.' }
        format.json { render json: @guardturn, status: :created, location: @guardturn }
      else
        format.html { render action: "new" }
        format.json { render json: @guardturn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /guardturns/1
  # PUT /guardturns/1.json
  def update
    @guardturn = Guardturn.find(params[:id])

    respond_to do |format|
      if @guardturn.update_attributes(params[:guardturn])
        format.html { redirect_to @guardturn, notice: 'Guardturn was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @guardturn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guardturns/1
  # DELETE /guardturns/1.json
  def destroy
    @guardturn = Guardturn.find(params[:id])
    @guardturn.destroy

    respond_to do |format|
      format.html { redirect_to guardturns_url }
      format.json { head :no_content }
    end
  end
end
