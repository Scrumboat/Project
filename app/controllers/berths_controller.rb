#encoding: utf-8

class BerthsController < ApplicationController
  # GET /berths
  # GET /berths.json
  def index
    @berths = Berth.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @berths }
    end
  end

  # GET /berths/1
  # GET /berths/1.json
  def show
    @berth = Berth.find(params[:id])
	@dock = Dock.find(params[:dock_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @berth }
    end
  end

  # GET /berths/new
  # GET /berths/new.json
  def new
    @dock = Dock.find(params[:dock_id])
    @berth = @dock.berths.build
    currentTotalWidth = Berth.where(:dock_id => params[:dock_id]).sum('width')
    @spaceLeft = @dock.length - currentTotalWidth

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @berth }
    end
  end

  # GET /berths/1/edit
  def edit
	@dock = Dock.find(params[:dock_id])
    @berth = Berth.find(params[:id])
	currentTotalWidth = Berth.where(:dock_id => params[:id]).sum("width")
	@spaceLeft = @dock.length - BigDecimal(currentTotalWidth.to_s)
  end

  # POST /berths
  # POST /berths.json
  def create
    @dock = Dock.find(params[:dock_id])
    currentTotalWidth = Berth.where(:dock_id => params[:dock_id]).sum('width')
    spaceLeft = @dock.length - currentTotalWidth
    newBerth = Berth.new(params[:berth])
    respond_to do |format|
      if currentTotalWidth + newBerth.width <= @dock.length
		if params[:berth][:Reknro].strip != ""
			@boat = Boat.where(:RekNro => params[:berth][:Reknro]).first
			if @boat != nil
				if @boat.Pituus <= newBerth.length && @boat.Leveys <= newBerth.width && @boat.Syvyys <= newBerth.depth
					@boat.Laituri = params[:dock_id]
					@boat.Laituripaikka = params[:berth][:number]
					@boat.save
				else
					params[:berth][:Reknro] = ""
				end
			end
		end
		@dock.berths << @dock.berths.build(params[:berth])
		newBerth.save
        format.html { redirect_to @dock, notice: 'Uusi laituripaikka luotiin onnistuneesti.' }
      else
        format.html { redirect_to @dock, notice: 'Laituripaikkojen leveys ylitti laiturin leveyden.
         Laiturissa on tilaa: ' + spaceLeft.to_s + ' m.' }
      end
    end
  end

  # PUT /berths/1
  # PUT /berths/1.json
  def update
	@dock = Dock.find(params[:dock_id])
    @berth = Berth.find(params[:id])
	
	newvalue = params[:berth][:width] 
	currentTotalWidth = Berth.where(:dock_id => params[:dock_id]).sum('width') 
	currentTotalWidth = BigDecimal(currentTotalWidth.to_s) - @berth.width
	currentTotalWidth = BigDecimal(currentTotalWidth.to_s)+ BigDecimal(newvalue.to_s) 
	isOk = BigDecimal(currentTotalWidth.to_s) <= @dock.length
	    respond_to do |format|
      if isOk && @berth.update_attributes(params[:berth])
		if params[:berth][:Reknro].strip != ""
			@boat = Boat.where(:RekNro => params[:berth][:Reknro]).first
			if @boat != nil
				if @boat.Pituus <= BigDecimal(params[:berth][:length].to_s) && @boat.Leveys <= BigDecimal(params[:berth][:width].to_s) && @boat.Syvyys <= BigDecimal(params[:berth][:depth].to_s)
					@boat.Laituri = params[:dock_id]
					@boat.Laituripaikka = params[:berth][:number]
					@boat.save
				else
					params[:berth][:Reknro] = ""
					@boat.Laituri = ""
					@boat.Laituripaikka = ""
					@boat.save
					@berth.update_attributes(params[:berth])
				end
			end
		end
        format.html { redirect_to @dock, notice: 'Laituripaikka päivitetty.'}
        format.json { head :no_content }
      else
        format.html { 
			flash[:notice] = 'Laituripaikkojen leveys ylitti laiturin leveyden'
			render :edit
		}
        format.json { render json: @berth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /berths/1
  # DELETE /berths/1.json
  def destroy
    @berth = Berth.find(params[:id])
	@boat = Boat.where(:RekNro => @berth.Reknro).first
	if @boat != nil
		@boat.Laituri = ""
		@boat.Laituripaikka = ""
		@boat.save
	end
    @berth.destroy
    
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Laituripaikka poistettu'}
      format.json { head :no_content }
    end
  end
end
