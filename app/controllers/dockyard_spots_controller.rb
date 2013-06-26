#encoding: utf-8

class DockyardSpotsController < ApplicationController

  before_filter :authenticate_admin!

  # GET /dockyard_spots
  # GET /dockyard_spots.json
  def index
    @dockyard_spots = DockyardSpot.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dockyard_spots }
    end
  end

  # GET /dockyard_spots/1
  # GET /dockyard_spots1.json
  def show
    @dockyard_spot = DockyardSpot.find(params[:id])
    @dockyard = Dockyard.find(params[:dockyard_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dockyard_spot }
    end
  end

  # GET /dockyard_spots/new
  # GET /dockyard_spots/new.json
  def new
    @dockyard = Dockyard.find(params[:dockyard_id])
    @dockyard_spot = @dockyard.dockyard_spots.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dockyard_spot }
    end
  end

  # GET /dockyard_spots/1/edit
  def edit
    @dockyard = Dockyard.find(params[:dockyard_id])
    @dockyard_spot = DockyardSpot.find(params[:id])
  end

  # POST /dockyard_spots
  # POST /dockyard_spots.json
  def create
    @dockyard = Dockyard.find(params[:dockyard_id])
    new_spot = DockyardSpot.new(params[:dockyard_spot])
    new_spot.dockyard_id = @dockyard.id
    boat = Boat.find_by_RekNro(params[:dockyard_spot][:boat_id])
    new_spot.boat_id = boat.id
    respond_to do |format|
    if new_spot.save
	format.html { redirect_to @dockyard, notice: 'Uusi telakkapaikka luotiin onnistuneesti.'}
      else
        format.html { redirect_to @dockyard, notice: 'Telakkapaikan luonti epäonnistui.' }
      end
    end
  end

  # PUT /dockyard_spots/1
  # PUT /dockyard_spots/1.json
  def update
    @dockyard = Dockyard.find(params[:dockyard_id])
    @dockyard_spot = DockyardSpot.find(params[:id])
    boat = Boat.find_by_RekNro(params[:dockyard_spot][:boat_id])
    params[:dockyard_spot][:boat_id] = boat.id
    respond_to do |format|
      if @dockyard_spot.update_attributes(params[:dockyard_spot])
        format.html { redirect_to @dockyard, notice: 'Telakkapaikan päivitys onnistui.'}
      else
        format.html { flash[:notice] = 'Telakkapaikan päivitys epäonnistui.'
	              render :edit }
        format.json { render json: @berth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dockyard_spots/1
  # DELETE /dockyard_spots/1.json
  def destroy
    @dockyard_spot = DockyardSpot.find(params[:id])
    @dockyard_spot.destroy
    
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Telakkapaikka poistettu.'}
      format.json { head :no_content }
    end
  end
end
