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
    dysn = DockyardSpot.find_all_by_dockyard_id(params[:dockyard_id]).last
    if dysn.nil?
      @next_available_number = 1
    else
      @next_available_number = DockyardSpot.find_all_by_dockyard_id(params[:dockyard_id]).last.number + 1
    end
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
    @dockyard_spot = DockyardSpot.new(params[:dockyard_spot])
    @dockyard_spot.dockyard_id = @dockyard.id
    @boat = Boat.find_by_RekNro(params[:dockyard_spot][:boat_id])
    @dockyard_spot.length = @boat.Pituus + 0.8 rescue params[:dockyard_spot][:length]
    @dockyard_spot.width = @boat.Leveys + 0.8 rescue params[:dockyard_spot][:width]
    @dockyard_spot.boat_id = @boat.id rescue nil
    can_fit = check_if_it_fits

    respond_to do |format|
      if boat_already_has_spot && can_fit && @dockyard_spot.save
        format.html { redirect_to @dockyard, notice: 'Uusi telakkapaikka luotiin onnistuneesti.'}
      else
        if !can_fit
          err_msg = 'Ei tarpeeksi tilaa veneelle.'
        elsif !boat_already_has_spot
          err_msg = 'Veneellä on jo telakkapaikka.'
        else
          err_msg = 'Telakkapaikan luonti epäonnistui.'
        end
        format.html { flash.now[:alert] = err_msg
                      render action: 'new' }
      end
    end
  end

  # PUT /dockyard_spots/1
  # PUT /dockyard_spots/1.json
  def update
    @dockyard = Dockyard.find(params[:dockyard_id])
    @dockyard_spot = DockyardSpot.find(params[:id])
    @boat = Boat.find_by_RekNro(params[:dockyard_spot][:boat_id])
    params[:dockyard_spot][:boat_id] = @boat.id unless @boat.nil?
    if @boat.nil?
      can_fit = true
    elsif
      can_fit = check_if_it_fits
    end

    respond_to do |format|
      if boat_already_has_spot && can_fit && @dockyard_spot.update_attributes(params[:dockyard_spot])
        format.html { redirect_to @dockyard, notice: 'Telakkapaikan päivitys onnistui.'}
      else
        if can_fit && boat_already_has_spot
          format.html { flash[:alert] = 'Telakkapaikan päivitys epäonnistui.'
                        render :edit}
        else
          format.html { flash[:alert] = can_fit ? ("Veneellä on jo paikka ("+ @boat_spot.number.to_s + ").") : 'Ei tarpeeksi tilaa veneelle.'
                        render :edit}
        end
        format.html { flash[:alert] = can_fit ? 'Telakkapaikan päivitys epäonnistui.' : 'Ei tarpeeksi tilaa veneelle.'
                      render :edit }
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

def check_if_it_fits
  current_width  = DockyardSpot.where(:dockyard_id => params[:dockyard_id]).sum('width')
  current_length = DockyardSpot.where(:dockyard_id => params[:dockyard_id]).sum('length')
  spot_width     = @dockyard_spot.width
  spot_length    = @dockyard_spot.length
  if !@boat.nil?
    if @dockyard_spot.width < @boat.Leveys + 0.8
      return false
    elsif @dockyard_spot.length < @boat.Pituus + 0.8
      return false
    end
  end
  return spot_width * spot_length + current_width * current_length < @dockyard.width * @dockyard.length
end

def boat_already_has_spot
  if @boat.nil?
    return true
  else
    @boat_spot = DockyardSpot.find_by_boat_id(@boat.id)
    return @boat_spot.nil?
  end
end