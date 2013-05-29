class BoatsMembersController < ApplicationController
  # GET /boats_members
  # GET /boats_members.json
  def index
    @boats_members = BoatsMember.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @boats_members }
    end
  end

  # GET /boats_members/1
  # GET /boats_members/1.json
  def show
    @boats_member = BoatsMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @boats_member }
    end
  end

  # GET /boats_members/new
  # GET /boats_members/new.json
  def new
    @boats_member = BoatsMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @boats_member }
    end
  end

  # GET /boats_members/1/edit
  def edit
    @boats_member = BoatsMember.find(params[:id])
  end

  # POST /boats_members
  # POST /boats_members.json
  def create
    @boats_member = BoatsMember.new(params[:boats_member])

    respond_to do |format|
      if @boats_member.save
        format.html { redirect_to @boats_member, notice: 'Boats member was successfully created.' }
        format.json { render json: @boats_member, status: :created, location: @boats_member }
      else
        format.html { render action: "new" }
        format.json { render json: @boats_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /boats_members/1
  # PUT /boats_members/1.json
  def update
    @boats_member = BoatsMember.find(params[:id])

    respond_to do |format|
      if @boats_member.update_attributes(params[:boats_member])
        format.html { redirect_to @boats_member, notice: 'Boats member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @boats_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boats_members/1
  # DELETE /boats_members/1.json
  def destroy
    @boats_member = BoatsMember.find(params[:id])
    @boats_member.destroy

    respond_to do |format|
      format.html { redirect_to boats_members_url }
      format.json { head :no_content }
    end
  end
end
