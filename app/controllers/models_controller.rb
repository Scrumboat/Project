class ModelsController < ApplicationController

  # GET /boats/1
  # GET /boats/1.json
  def show
    @malli = Model.find(:first, :conditions => ["\"ValmMalli\" = ?", params[:id]])
    respond_to do |format|
      format.json { render json: @malli }
    end
  end

end
