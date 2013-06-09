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

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @berth }
    end
  end

  # GET /berths/new
  # GET /berths/new.json
  def new
    @berth = Berth.new
    @dock = Dock.find(params[:dock_id])
    currentTotalWidth = Berth.where(:dock_id => params[:dock_id]).sum('width')
    @spaceLeft = @dock.length - currentTotalWidth

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @berth }
    end
  end

  # GET /berths/1/edit
  def edit
    @berth = Berth.find(params[:id])
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
    @berth = Berth.find(params[:id])

    respond_to do |format|
      if @berth.update_attributes(params[:berth])
        format.html { redirect_to @berth, notice: 'Berth was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @berth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /berths/1
  # DELETE /berths/1.json
  def destroy
    @berth = Berth.find(params[:id])
    @berth.destroy

    respond_to do |format|
      format.html { redirect_to berths_url }
      format.json { head :no_content }
    end
  end
end
