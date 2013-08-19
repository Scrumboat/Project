# encoding: UTF-8
class BoatsController < ApplicationController
  autocomplete :member, :nimi
  autocomplete :member, :jno
 # helper_method :sort_column, :sort_direction

  # GET /boats
  # GET /boats.json

  def index
    #@boats = Boat.order(sort_column + ' ' + sort_direction)
   # @boats = Boat.all
   # if params[:search]
      @boats = Boat.search(params[:search])
   # else
     # @boats = Boat.order(sort_column + ' ' + sort_direction)
   # end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @boats }
    end
  end

  # GET /boats/1
  # GET /boats/1.json
  def show
    @boat = Boat.find(params[:id])
    @dockyard_spot = DockyardSpot.find_by_boat_id(@boat.id)
    @dockyard = Dockyard.find(@dockyard_spot.dockyard_id) unless @dockyard_spot.nil?
    @berth = Berth.find_by_reknro(@boat.reknro)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @boat }
    end
  end

  # GET /boats/new
  # GET /boats/new.json
  def new
    @boat = Boat.new
    @boat.BoatsMembers.build
    @mallit = Model.select("\"valm_malli\"")
    @models = Model.all.map(&:valm_malli).insert(0, "")
    @laituri_idt = Array.new
    @laiturit = Dock.all
    @laiturit.each do |f|
       @laituri_idt.push(f.id)
    end

    @laituripaikat = Berth.where(:dock_id => params[:laituri]).all.map(&:id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @boat }
    end
  end

  # GET /boats/1/edit
  def edit
    @boat = Boat.find(params[:id], :include => :members)
    @mallit = Model.select("\"valm_malli\"")
    @models = Model.all.map(&:valm_malli).insert(0, "")
    @laituri_idt = Array.new
    @laiturit = Dock.all
    @laiturit.each do |f|
      @laituri_idt.push(f.id)
    end

    
	  show_jno_in_edit_instead_of_id
  end

  # POST /boats
  # POST /boats.json
  def create
    @boat = Boat.new(params[:boat])

    @model = Model.where(:valm_malli => params[:boat][:valm_malli]).first

    if @model.nil?
      @model = Model.new
      @model.korkeus = @boat.korkeus
      @model.leveys = @boat.leveys
      @model.pituus = @boat.pituus
      @model.syvyys = @boat.syvyys
      @model.uppouma = @boat.uppouma
      @model.valm_malli = @boat.valm_malli
      @model.tyyppi = @boat.tyyppi
      @model.save
    end
	
    changejnoToId
    respond_to do |format|
      if @boat.valid? && @onkoOk
	    check_dock_and_berth(format)
	    @boat.save
        format.html { redirect_to @boat, notice: 'Vene luotiin onnistuneesti.' }
        format.json { render json: @boat, status: :created, location: @boat }
      else
        format.html { flash.now[:alert] = @member == nil ? 'Jäsentä ei löytynyt' : 'Tuntematon virhe' 
                      render action: "new" }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /boats/1
  # PUT /boats/1.json
  def update
    @boat = Boat.find(params[:id], :include => [:members])
	  @dockold = Dock.find(params[:Laituri]) unless params[:Laituri].blank?
	  @berthold = @berth = Berth.where(:dock_id => @dockold.id, :number => params[:Laituripaikka]) unless params[:Laituri].blank?
	  #@boat = Boat.find(params[:id])
    #changejnoToId
    change_jno_to_id_for_update
    if params[:boat][:BoatsMembers_attributes] == nil
      @onkoOk = false
    end
    respond_to do |format|
      if @onkoOk && @boat.update_attributes(params[:boat])
	      check_dock_and_berth(format)
        format.html { redirect_to @boat, notice: 'Veneen muokkaus onnistui.' }
        format.json { head :no_content }
      else
        format.html { 
	        flash[:notice] = 'Virheellinen jäsennumero.'
	        render action: "edit"
	      }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boats/1
  # DELETE /boats/1.json
  def destroy
    @boat = Boat.find(params[:id])
	  remove_reknro_from_berth
    @boat.destroy

    respond_to do |format|
      format.html { redirect_to boats_url }
      format.json { head :no_content }
    end
  end

  def change_jno_to_id_for_update

    params[:boat][:BoatsMembers_attributes].values.each do |bm|
    member = Member.find_by_jno(bm[:member_id])
    if member == nil
      @onkoOk = false
		  return
    end
    bm[:member_id] = member.id
    end if params[:boat] and params[:boat][:BoatsMembers_attributes]
    @onkoOk = true
  end

  def changejnoToId
    taulu = []
	  params[:boat][:BoatsMembers_attributes].values.each do |bm|
		  if bm[:member_id].strip == ""
			  @onkoOk = false
			  return
		  end
		  taulu << bm[:member_id]
	    end if params[:boat] and params[:boat][:BoatsMembers_attributes]
	
	    i = 0
	    @onkoOk = true
	    @boat.BoatsMembers.each do |bm|
		  @member = Member.find_by_jno(taulu[i])
		  if @member == nil
			  @onkoOk = false
			  return
		  else
			  bm.member_id = @member.id
			  i = i+1
		  end
	  end
	  @onkoOk = !taulu.empty?
  end
  
  def show_jno_in_edit_instead_of_id
	  @boat.BoatsMembers.each do |bm|
		@member = Member.find(bm.member_id)
		if @member == nil
			@onkoOk = false
			return
		end
		bm.member_id = @member.jno
    end
  end
  
  def check_dock_and_berth(format)
    if is_number?(params[:Laituripaikka]) && is_number?(params[:Laituri])
      if Dock.exists?(params[:Laituri])
        @dock = Dock.find(params[:Laituri])
        if Berth.exists?(:dock_id => @dock.id, :number => params[:Laituripaikka])
          @berth = Berth.where(:dock_id => @dock.id, :number => params[:Laituripaikka]).first
          if check_if_it_fit
		        if !@berthold.nil? && @berthold != @berth
			        @berthold.reknro = ""
			        @berthold.save
			      end
            @berth.reknro = params[:boat][:reknro]
            @berth.save
          end
        else
		      show_jno_in_edit_instead_of_id
          set_dock_and_bert_empty
		      format.html {
            flash[:notice] = 'Virheellinen laituri/laituripaikka.'
            render action: "new"
          }
        end
      else
	      show_jno_in_edit_instead_of_id
        set_dock_and_bert_empty
		    format.html {
          flash[:notice] = 'Virheellinen laituri/laituripaikka.'
          render action: "new"
        }
      end
    end
  end

  def is_number?(object)
    true if Integer(object) rescue false
  end

  def set_dock_and_bert_empty
    params[:Laituri] = ''
    params[:Laituripaikka] = ''
  end

  def check_if_it_fit
    true if BigDecimal(params[:boat][:pituus].to_s) <= BigDecimal(@berth.length.to_s) && BigDecimal(params[:boat][:leveys].to_s) <= BigDecimal(@berth.width.to_s) && BigDecimal(params[:boat][:syvyys].to_s) <= BigDecimal(@berth.depth.to_s)
  end

  def remove_reknro_from_berth
    if is_number?(params[:Laituri]) && is_number?(params[:Laituripaikka])
      @dock = Dock.find(@params[:Laituri])
      @berth = Berth.where(:dock_id => @dock.id, :number => params[:Laituripaikka]).first
      @berth.reknro = ''
      @berth.save
    end
  end

 # private
   # def sort_column
    #  Boat.column_names.include?(params[:sort]) ? Boat.connection.quote_column_name(params[:sort]) : Boat.connection.quote_column_name("nimi")
    #end
  
   # def sort_direction
     # %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    #end
end
