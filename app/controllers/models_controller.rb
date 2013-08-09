# encoding: utf-8

class ModelsController < ApplicationController

	def index
		@models = Model.all  

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @models }
		end
	end
  
  def show
    @model = Model.find(:first, :conditions => ["\"ValmMalli\" = ?", params[:id]])
    respond_to do |format|
      format.json { render json: @model }
    end
  end

  def new
    @model = Model.new
    @teksti = "Luo uusi malli"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @model }
    end
  end
  
  def edit
    @model = Model.find(params[:id])
    @teksti = "Muokkaa mallia"
  end
  
  def create
    @model = Model.new(params[:model])

    respond_to do |format|
      if @model.save
        format.html { redirect_to models_url, notice: 'Malli luotiin onnistuneesti.' }
        format.json { render json: @model, status: :created, location: @model }
      else
        format.html { render action: "new" }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @model = Model.find(params[:id])

    respond_to do |format|
      if @model.update_attributes(params[:model])
        format.html { redirect_to models_url, notice: 'Mallin päivitys onnistui.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @model = Model.find(params[:id])
    @model.destroy

    respond_to do |format|
      format.html { redirect_to models_url }
      format.json { head :no_content }
    end
  end
  
end
