class MallisController < ApplicationController

	def index
		@mallis = Malli.all  

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @mallis }
		end
	end
  
  def show
    @malli = Malli.find(:first, :conditions => ["\"ValmMalli\" = ?", params[:id]])
    respond_to do |format|
      format.json { render json: @malli }
    end
  end

  def new
    @malli = Malli.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @malli }
    end
  end
  
  def edit
    @malli = Malli.find(params[:id])
  end
  
  def create
    @malli = Malli.new(params[:malli])

    respond_to do |format|
      if @malli.save
        format.html { redirect_to mallis_url, notice: 'Malli was successfully created.' }
        format.json { render json: @malli, status: :created, location: @malli }
      else
        format.html { render action: "new" }
        format.json { render json: @malli.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @malli = Malli.find(params[:id])

    respond_to do |format|
      if @malli.update_attributes(params[:malli])
        format.html { redirect_to mallis_url, notice: 'Malli was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @malli.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @malli = Malli.find(params[:id])
    @malli.destroy

    respond_to do |format|
      format.html { redirect_to mallis_url }
      format.json { head :no_content }
    end
  end
  
end
