#encoding: utf-8

class GuardseasonsController < ApplicationController
  # GET /guardseasons
  # GET /guardseasons.json
  def index
    @guardseasons = Guardseason.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guardseasons }
    end
  end

  # GET /guardseasons/1
  # GET /guardseasons/1.json
  def show
    @guardseason = Guardseason.find(params[:id])
    @guardturns = @guardseason.guardturns

    if params[:paivat] != nil
      params[:paivat].each do |paiva_id|
        @guardturn = Guardturn.where(:id => paiva_id).first
        if @guardturn.vartioidaanko
          @guardturn.vartioidaanko = false
          @guardturn.save
        else
          @guardturn.vartioidaanko = true
          @guardturn.save
        end
      end
    end
    if params[:vartiopaiva]
      Guardseason.alustavartiopaivat(params[:guardseason_id])
      flash[:notice] = "Vartiopäivät luotu kaudelle " + params[:nimi] + "!"
      redirect_to guardseasons_url
      return
    end

    if params[:vartiojno]
      Guardseason.alustavartiovuorot(params[:guardseason_id])
      flash[:notice] = "Vartiovuorot luotu kaudelle " + params[:nimi] + "!"
      redirect_to guardseasons_url
      return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @guardseason }
    end
  end

  # GET /guardseasons/new
  # GET /guardseasons/new.json
  def new
    @guardseason = Guardseason.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @guardseason }
    end
  end

  # GET /guardseasons/1/edit
  def edit
    @guardseason = Guardseason.find(params[:id])
  end

  # POST /guardseasons
  # POST /guardseasons.json
  def create
    @guardseason = Guardseason.new(params[:guardseason])

    respond_to do |format|
      if @guardseason.save
        format.html { redirect_to @guardseason, notice: 'Guardseason was successfully created.' }
        format.json { render json: @guardseason, status: :created, location: @guardseason }
      else
        format.html { render action: "new" }
        format.json { render json: @guardseason.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /guardseasons/1
  # PUT /guardseasons/1.json
  def update
    @guardseason = Guardseason.find(params[:id])

    respond_to do |format|
      if @guardseason.update_attributes(params[:guardseason])
        format.html { redirect_to @guardseason, notice: 'Guardseason was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @guardseason.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guardseasons/1
  # DELETE /guardseasons/1.json
  def destroy
    @guardseason = Guardseason.find(params[:id])
    @guardseason.destroy

    respond_to do |format|
      format.html { redirect_to guardseasons_url }
      format.json { head :no_content }
    end
  end
end
