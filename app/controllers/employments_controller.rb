class EmploymentsController < ApplicationController
  # GET /employments
  # GET /employments.json
  def index
    @employments = Employment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employments }
    end
  end

  # GET /employments/1
  # GET /employments/1.json
  def show
    @employment = Employment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employment }
    end
  end

  # GET /employments/new
  # GET /employments/new.json
  def new
    @employment = Employment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employment }
    end
  end

  # GET /employments/1/edit
  def edit
    @employment = Employment.find(params[:id])
  end

  # POST /employments
  # POST /employments.json
  def create
    @employment = Employment.new(params[:employment])

    respond_to do |format|
      if @employment.save
        format.html { redirect_to @employment, notice: 'Employment was successfully created.' }
        format.json { render json: @employment, status: :created, location: @employment }
      else
        format.html { render action: "new" }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employments/1
  # PUT /employments/1.json
  def update
    @employment = Employment.find(params[:id])

    respond_to do |format|
      if @employment.update_attributes(params[:employment])
        format.html { redirect_to @employment, notice: 'Employment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employments/1
  # DELETE /employments/1.json
  def destroy
    @employment = Employment.find(params[:id])
    @employment.destroy

    respond_to do |format|
      format.html { redirect_to employments_url }
      format.json { head :no_content }
    end
  end
end
