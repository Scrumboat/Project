

class StoragesController < ApplicationController
  # GET /storages
  # GET /storages.json
  def index
    #@storages = Storage.all
    if params[:search].blank? then params[:search] = 'kaikki' end
	@storages = Storage.search(params[:search])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @storages }
    end
  end

  # GET /storages/new
  # GET /storages/new.json
  def new
    @storage = Storage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @storage }
    end
  end

  # GET /storages/1/edit
  def edit
    @storage = Storage.find(params[:id])
  end

  # POST /storages
  # POST /storages.json
  def create
    @storage = Storage.new(params[:storage])
	@onkojno = false
	if params[:jno]
	  fetch_member_and_set_isOk
	  @onkojno = true
	else
	  @isOk = true
	end
    respond_to do |format|
      if @isOk && @storage.save
	    if @onkojno
		  @member.varasto = @storage.vk
          @member.save
		end
      format.html { redirect_to storages_path, notice: 'varastokoppi luotu onnistuneesti'}
      format.json { render json: @storage, status: :created, location: @storage }
      else
        format.html { 
          flash[:notice] = 'Virheellinen jno.'
          render :new
        }
        format.json { render json: @storage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /storages/1
  # PUT /storages/1.json
  def update
    @storage = Storage.find(params[:id])
	@onkovanhaomistaja = false
	if params[:jno]
	  fetch_member_and_set_isOk
	  @onkojno = true
	else
	  @isOk = true
	end
	
	if !@storage.jno.nil?
	  oldjno = @storage.jno
	  @onkovanhaomistaja = true
	end
    respond_to do |format|
      if @isOk && @storage.update_attributes(params[:storage])
        if @onkovanhaomistaja
		  if oldjno != @storage.jno
            oldmember = Member.where(:jno => oldjno).first
            if oldmember != nil
              oldmember.varasto = ""
              oldmember.save
            end
          end
		end
        if @onkojno
		  @member.varasto = @storage.vk
          @member.save
		end
        format.html { redirect_to storages_path, notice: 'varastokoppi muokattu onnistuneesti' }
        format.json { head :no_content }
      else
        format.html { 
          flash[:error] = 'Virheellinen jno.'
          render :edit
        }
        format.json { render json: @storage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storages/1
  # DELETE /storages/1.json
  def destroy
    @storage = Storage.find(params[:id])
	@member = Member.where(:jno => @storage.jno).first
	if @member != nil
		@member.varasto = ""
		@member.save
	end
    @storage.destroy

    respond_to do |format|
      format.html { redirect_to storages_url }
      format.json { head :no_content }
    end
  end
  
  def fetch_member_and_set_isOk
    @isOk= true
    @member = Member.where(:jno => params[:storage][:jno]).first
    if @member == nil
      @isOk = false
    end
  end
end
