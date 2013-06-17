class ModelsController < ApplicationController

  # GET /boats/1
  # GET /boats/1.json
  def show
    @model = Model.find(:first, :conditions => ["\"ValmMalli\" = ?", params[:id]])
    respond_to do |format|
      format.json { render json: @model }
    end
  end

end
