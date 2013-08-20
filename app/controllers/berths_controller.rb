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
    @free_number = 1
    # ^ HUOM !!!!!!! tähän pitäis laittaa mut ei toimi :( @free_number = @dock.berths.max_by(&:number).number
    ind = @dock.berths.all.map(&:number)
    indeksi = 1
    ind.each do |i|
       if i != indeksi
         @free_number = indeksi
         break
       end
      indeksi = indeksi + 1
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @berth }
    end
  end

  # GET /berths/1/edit
  def edit
    @dock = Dock.find(params[:dock_id])
    @berth = Berth.find(params[:id])
    currentTotalWidth = Berth.where(:dock_id => params[:dock_id]).sum("width")
    @spaceLeft =  @dock.length - currentTotalWidth
  end

  # POST /berths
  # POST /berths.json
  def create
    @dock = Dock.find(params[:dock_id])
    currentTotalWidth = Berth.where(:dock_id => params[:dock_id]).sum('width')
    spaceLeft = @dock.length - currentTotalWidth
    @boat = Boat.find_by_reknro(params[:berth][:reknro])
    @newBerth = @dock.berths.build(params[:berth])
    @newBerth.boat_id = @boat.id unless @boat.nil?
    @ok = true if @boat.nil? || (@boat.leveys < params[:berth][:width].to_f && @boat.pituus < params[:berth][:length].to_f)
    #@newBerth.dock_id = params[:dock_id]
    respond_to do |format|
      if (currentTotalWidth + @newBerth.width <= @dock.length) && @ok
        #create_connection_to_the_boat(format)
        #@dock.berths << @dock.berths.build(params[:berth])
        @newBerth.save
        format.html { redirect_to @dock, notice: 'Uusi laituripaikka luotiin onnistuneesti.'}
      else
        format.html { redirect_to @dock, notice: 'Laituripaikkojen leveys ylitti laiturin leveyden.
         Laiturissa on tilaa: ' + spaceLeft.to_s + ' m. Tai veneen mitat ylittivät paikan mitat.' }
      end
    end
  end

  # PUT /berths/1
  # PUT /berths/1.json
  def update
    @dock = Dock.find(params[:dock_id])
    @berth = Berth.find(params[:id])
    newvalue = params[:berth][:width]
    currentTotalWidth = Berth.where(:dock_id => params[:dock_id]).sum('width').to_f
    currentTotalWidth = currentTotalWidth - @berth.width.to_f
    currentTotalWidth = currentTotalWidth + newvalue.to_f
    isOk = currentTotalWidth <= @dock.length.to_f
    okRek = true
    respond_to do |format|
      if isOk && @berth.update_attributes(params[:berth])
        unless params[:berth][:reknro].blank?
          @boat = Boat.where(:reknro => params[:berth][:reknro]).first
          if @boat != nil
            unless @boat.pituus.to_f <= params[:berth][:length].to_f && @boat.leveys.to_f <= params[:berth][:width].to_f && @boat.syvyys.to_f <= params[:berth][:depth].to_f
              params[:berth][:reknro] = ""
              flash[:alert] = 'Vene on liian suuri mahtuakseen paikkaan.'
              @berth.update_attributes(params[:berth])
            end
          else
            okRek = false
            format.html { redirect_to @dock, notice: 'Laituripaikkaa ei päivitetty kyseiselle rekisterinumerolle, virheellinen rekisterinumero.'}
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

    # boat ei enää pidä kirjaa laituristaan
    #@boat = Boat.where(:reknro => @berth.reknro).first
    #if @boat != nil
    #  @boat.Laituri = ""
    #  @boat.Laituripaikka = ""
    #  @boat.save
    #end

    @berth.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Laituripaikka poistettu'}
      format.json { head :no_content }
    end
  end

  def create_connection_to_the_boat(format)
    if params[:berth][:reknro].strip != ""
      @boat = Boat.where(:reknro => params[:berth][:reknro]).first
      if @boat != nil
        if @boat.pituus <= @newBerth.length && @boat.leveys <= @newBerth.width && @boat.syvyys <= @newBerth.depth
          @boat.Laituri = params[:dock_id]
          @boat.Laituripaikka = params[:berth][:number]
          @boat.save
        else
          params[:berth][:reknro] = ""
        end
      else
        @okRek = false
        format.html { redirect_to @dock, notice: 'Laituripaikkaa ei päivitetty kyseiselle rekisterinumerolle, virheellinen rekisterinumero.'}
      end
    end
    if !@okRek
      params[:berth][:reknro] = ""
    end
    if params[:berth][:jno].strip != ""
      params[:berth][:jno] = ""
    end
  end

end
