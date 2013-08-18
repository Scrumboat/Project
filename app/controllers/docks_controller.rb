class DocksController < ApplicationController
  # GET /docks
  # GET /docks.json
  def index
    @docks = Dock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @docks }
    end
  end

  # GET /docks/1
  # GET /docks/1.json
  def show
    @dock = Dock.find(params[:id])
    @berths = @dock.berths
    currentTotalWidth = Berth.where(:dock_id => params[:id]).sum("width")
    @spaceLeft = @dock.length - currentTotalWidth
    @minLaituripaikanHinta = Pricing.where(:target => "minLaituripaikanHintaAlle7").first
	@hintaAlle7 = Pricing.where(:target => "minLaituripaikanHintaAlle7").first
	@hintaYli7 = Pricing.where(:target => "minLaituripaikanHintaYli7").first
    #@veneenHinnanKasvu = Pricing.where(:target => "veneenHinnanKasvu").first
    #@leveysLaituripaikanHinnanKasvuun = Pricing.where(:target => "leveysLaituripaikanHinnanKasvuun").first
     #Dock.find(:width => params[:id])
    #<td><%= (berth.width/@leveysLaituripaikanHinnanKasvuun.to_s).ceil.to_s %></td>
     #<td><%= BigDecimal(berth.width.to_s)/BigDecimal(@leveysLaituripaikanHinnanKasvuun.to_s).to_s.ceil %></td>
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dock }
    end
  end

  # GET /docks/new
  # GET /docks/new.json
  def new
    @dock = Dock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dock }
    end
  end

  # GET /docks/1/edit
  def edit
    @dock = Dock.find(params[:id])
  end

  # POST /docks
  # POST /docks.json
  def create
    @dock = Dock.new(params[:dock])

    respond_to do |format|
      if @dock.save
        format.html { redirect_to @dock, notice: 'Dock was successfully created.' }
        format.json { render json: @dock, status: :created, location: @dock }
      else
        format.html { render action: "new" }
        format.json { render json: @dock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /docks/1
  # PUT /docks/1.json
  def update
    @dock = Dock.find(params[:id])

    respond_to do |format|
      if @dock.update_attributes(params[:dock])
        format.html { redirect_to @dock, notice: 'Dock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /docks/1
  # DELETE /docks/1.json
  def destroy
    @dock = Dock.find(params[:id])
    @dock.destroy

    respond_to do |format|
      format.html { redirect_to docks_url }
      format.json { head :no_content }
    end
  end
end
