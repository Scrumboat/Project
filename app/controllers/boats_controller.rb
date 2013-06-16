# encoding: UTF-8
class BoatsController < ApplicationController

  helper_method :sort_column, :sort_direction

  # GET /boats
  # GET /boats.json
  before_filter :authenticate_admin!
  def index
    @boats = Boat.order(sort_column + ' ' + sort_direction)
   # @boats = Boat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @boats }
    end
  end

  # GET /boats/1
  # GET /boats/1.json
  def show
    @boat = Boat.find(params[:id])

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
    @models = Model.select("\"ValmMalli\"")
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @boat }
    end
  end

  # GET /boats/1/edit
  def edit
    @boat = Boat.find(params[:id], :include => :members)
	show_jno_in_edit_instead_of_id
  end

  # POST /boats
  # POST /boats.json
  def create
    @boat = Boat.new(params[:boat])

    @model = Boat.find(:first, :conditions => ["\"ValmMalli\" = ?", params[:boat][:ValmMalli]])

    if @model == nil
      @model = Malli.new
      @model.Korkeus = @boat.Korkeus
      @model.Leveys = @boat.Leveys
      @model.Pituus = @boat.Pituus
      @model.Syvyys = @boat.Syvyys
      @model.Uppouma = @boat.Uppouma
      @model.ValmMalli = @boat.ValmMalli
      @model.tyyppi = @boat.tyyppi
      @model.save
    end

    changeJnoToId

    respond_to do |format|
      if @boat.valid? && @onkoOk
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
    #@boat = Boat.find(params[:id])
    #changeJnoToId
    change_jno_to_id_for_update
	if params[:boat][:BoatsMembers_attributes] == nil
		@onkoOk = false
	end
    respond_to do |format|
      if @boat.update_attributes(params[:boat]) && @onkoOk
        format.html { redirect_to @boat, notice: 'Veneen muokkaus onnistui.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boats/1
  # DELETE /boats/1.json
  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy

    respond_to do |format|
      format.html { redirect_to boats_url }
      format.json { head :no_content }
    end
  end

  def change_jno_to_id_for_update

    params[:boat][:BoatsMembers_attributes].values.each do |bm|
      member = Member.find_by_Jno(bm[:member_id])
      if member == nil
        @onkoOk = false
		return
      end
      bm[:member_id] = member.id
    end if params[:boat] and params[:boat][:BoatsMembers_attributes]
    @onkoOk = true
  end

  def changeJnoToId
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
		@member = Member.find_by_Jno(taulu[i])
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
		bm.member_id = @member.Jno
    end
  end
  private
    def sort_column
      Boat.column_names.include?(params[:sort]) ? params[:sort] : "Omistaja"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
end
