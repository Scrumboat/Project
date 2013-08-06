# encoding: UTF-8
class MembersController < ApplicationController

 # helper_method :sort_column, :sort_direction

  # GET /members
  # GET /members.json
  def index
    #@members = Member.order(sort_column + ' ' + sort_direction)
    #@members = Member.search(params[:search])
   # if params[:search]
      if params[:deleted]
        @members = Member.is_deleted.search(params[:search])
        @naytateksti = "Näytä aktiiviset"
        @osoite = "actived"
      else
        @members = Member.active.search(params[:search])
        @naytateksti = "Näytä poistetut"
        @osoite = "deleted"
      end
   # else
    # @members = Member.order(sort_column + ' ' + sort_direction)
   # end
  #@members = Member.find(:all, :conditions => ["deleted_at > ? OR deleted_at IS NULL", 1.years.ago])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new
    @nextJno = Member.maximum("Jno") + 1

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member].merge(:updated_by => current_admin))

    respond_to do |format|
      if @member.save
	      if params.has_key?(:VeneRekNro) && params[:VeneRekNro].strip != ''
		      @boat = Boat.find_by_RekNro(params[:VeneRekNro])
          @boats_member = @member.BoatsMembers.create(:boat_id => @boat.id)
	      end
        format.html { redirect_to @member, notice: 'Jäsen luotiin onnistuneesti.' }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member].merge(:updated_by => current_admin))
        format.html { redirect_to @member, notice: 'Jäsenen tietojen päivitys onnistui.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.boats.count > 0
        format.html { redirect_to @member, alert: 'Jäsenen veneet poistettava ensin.' }
        format.json { head :no_content }
      else
	      @member.deleted = true
	      @member.deleted_at = DateTime.now
	      @member.save
        format.html { redirect_to members_url }
        format.json { head :no_content}
      end
    end
  end

 # private
 # def sort_column
  #  Member.column_names.include?(params[:sort]) ? Member.connection.quote_column_name(params[:sort]) : Member.connection.quote_column_name("Jno")
 # end
  
 # def sort_direction
  #  %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
 # end

end
