class OwnershipsController < ApplicationController
  # GET /ownerships
  # GET /ownerships.json
  def index
    @ownerships = Ownership.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ownerships }
    end
  end

  # GET /ownerships/1
  # GET /ownerships/1.json
  def show
    @ownership = Ownership.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ownership }
    end
  end

  # GET /ownerships/new
  # GET /ownerships/new.json
  def new
    @ownership = Ownership.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ownership }
    end
  end

  # GET /ownerships/1/edit
  def edit
    @ownership = Ownership.find(params[:id])
  end

  # POST /ownerships
  # POST /ownerships.json
  def create
    @ownership = Ownership.new(params[:ownership])

    respond_to do |format|
      if @ownership.save
        format.html { redirect_to @ownership, notice: 'Ownership was successfully created.' }
        format.json { render json: @ownership, status: :created, location: @ownership }
      else
        format.html { render action: "new" }
        format.json { render json: @ownership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ownerships/1
  # PUT /ownerships/1.json
  def update
    @ownership = Ownership.find(params[:id])

    respond_to do |format|
      if @ownership.update_attributes(params[:ownership])
        format.html { redirect_to @ownership, notice: 'Ownership was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ownership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ownerships/1
  # DELETE /ownerships/1.json
  def destroy
    @ownership = Ownership.find(params[:id])
    @ownership.destroy

    respond_to do |format|
      format.html { redirect_to ownerships_url }
      format.json { head :no_content }
    end
  end
end
