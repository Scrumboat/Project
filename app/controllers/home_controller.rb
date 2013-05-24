class HomeController < ApplicationController
  
  before_filter :authenticate_admin!

  def index
  	respond_to do |format|
      format.html # index.html.erb
    end
  end
end
