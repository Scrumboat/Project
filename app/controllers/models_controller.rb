class ModelsController < ApplicationController

  # GET /boats/1
  # GET /boats/1.json
  def show
<<<<<<< HEAD
    @malli = Model.find(:first, :conditions => ["\"ValmMalli\" = ?", params[:id]])
    respond_to do |format|
      format.json { render json: @malli }
=======
    @model = Model.find(:first, :conditions => ["\"ValmMalli\" = ?", params[:id]])
    respond_to do |format|
      format.json { render json: @model }
>>>>>>> e1d2dcfd8f59ddb5e7ed8bc676a73d6da22b0d3f
    end
  end

end
