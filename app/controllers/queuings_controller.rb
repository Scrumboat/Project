# encoding: UTF-8

class QueuingsController < ApplicationController
	
  # GET /queuings
  # GET /queuings.json
  def index
    #@queuings = Queuing.all
    #listataan defaulttina varastokopin jonottajat
    if params[:search].blank? then params[:search] = 'varastokoppi' end
    @queuings = Queuing.where(:tyyppi => params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @queuings }
    end
  end

  # GET /queuings/1
  # GET /queuings/1.json
  def show
    @queuing = Queuing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @queuing }
    end
  end

  # GET /queuings/new
  # GET /queuings/new.json
  def new
    @queuing = Queuing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @queuing }
    end
  end

  # GET /queuings/1/edit
  def edit
    @queuing = Queuing.find(params[:id])
  end

  # POST /queuings
  # POST /queuings.json
  def create
    @queuing = Queuing.new(params[:queuing])

    respond_to do |format|
      if @queuing.save
        format.html { redirect_to @queuing, notice: 'queuing was successfully created.' }
        format.json { render json: @queuing, status: :created, location: @queuing }
      else
        format.html { render action: "new" }
        format.json { render json: @queuing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /queuings/1
  # PUT /queuings/1.json
  def update
    @queuing = Queuing.find(params[:id])

    respond_to do |format|
      if @queuing.update_attributes(params[:queuing])
        format.html { redirect_to @queuing, notice: 'queuing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @queuing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /queuings/1
  # DELETE /queuings/1.json
  def destroy
    @queuing = Queuing.find(params[:id])
    @queuing.destroy

    respond_to do |format|
      format.html { redirect_to queuings_url }
      format.json { head :no_content }
    end
  end
end
