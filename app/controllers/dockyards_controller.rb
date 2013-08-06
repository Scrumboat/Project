class DockyardsController < ApplicationController


  # GET /dockyards
  # GET /dockyards.json
  def index
    @dockyards = Dockyard.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dockyards }
    end
  end

  # GET /dockyards/1
  # GET /dockyards/1.json
  def show
    @dockyard       = Dockyard.find(params[:id])
    @dockyard_spots = @dockyard.dockyard_spots
    length_taken    = DockyardSpot.where(:dockyard_id => params[:id]).sum('length')
    width_taken     = DockyardSpot.where(:dockyard_id => params[:id]).sum('width')
    @space_left     = (@dockyard.length * @dockyard.width) - (length_taken * width_taken)
    @width_left     = @dockyard.width - width_taken
    @length_left    = @dockyard.length - length_taken
    @telakanNeliohinta = Pricing.where(:target => "telakanNeliohinta").first
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dockyard }
    end
  end

  # GET /dockyards/new
  # GET /dockyards/new.json
  def new
    @dockyard = Dockyard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dockyard }
    end
  end

  # GET /dockyards/1/edit
  def edit
    @dockyard = Dockyard.find(params[:id])
  end

  # POST /dockyards
  # POST /dockyards.json
  def create
    @dockyard = Dockyard.new(params[:dockyard])

    respond_to do |format|
      if @dockyard.save
        format.html { redirect_to @dockyard, notice: 'Dockyard was successfully created.' }
        format.json { render json: @dockyard, status: :created, location: @dockyard }
      else
        format.html { render action: "new" }
        format.json { render json: @dockyard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dockyards/1
  # PUT /dockyards/1.json
  def update
    @dockyard = Dockyard.find(params[:id])

    respond_to do |format|
      if @dockyard.update_attributes(params[:dockyard])
        format.html { redirect_to @dockyard, notice: 'Dockyard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dockyard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dockyards/1
  # DELETE /dockyards/1.json
  def destroy
    @dockyard = Dockyard.find(params[:id])
    @dockyard.destroy

    respond_to do |format|
      format.html { redirect_to dockyards_url }
      format.json { head :no_content }
    end
  end
end
