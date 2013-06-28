

class StoragesController < ApplicationController
  # GET /storages
  # GET /storages.json
  def index
    @storages = Storage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @storages }
    end
  end

  # GET /storages/1
  # GET /storages/1.json
  def show
    @storage = Storage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @storage }
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
    fetch_member_and_set_isOk
    respond_to do |format|
      if @isOk && @storage.save
        @member.Varasto = @storage.vk
        @member.save
      format.html { redirect_to @storage, notice: 'Varastokoppi luotu onnistuneesti'}
      format.json { render json: @storage, status: :created, location: @storage }
      else
        format.html { 
          flash[:notice] = 'Virheellinen Jno.'
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
	fetch_member_and_set_isOk
	oldjno = @storage.jno
	
    respond_to do |format|
      if @isOk && @storage.update_attributes(params[:storage])
        if oldjno != @storage.jno
          oldmember = Member.where(:Jno => oldjno).first
          if oldmember != nil
            oldmember.Varasto = ""
            oldmember.save
          end
        end
        @member.Varasto = @storage.vk
        @member.save
        format.html { redirect_to @storage, notice: 'Varastokoppi muokattu onnistuneesti' }
        format.json { head :no_content }
      else
        format.html { 
          flash[:notice] = 'Virheellinen Jno.'
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
	@member = Member.where(:Jno => @storage.jno).first
	if @member != nil
		@member.Varasto = ""
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
    @member = Member.where(:Jno => params[:storage][:jno]).first
    if @member == nil
      @isOk = false
    end
  end
end
