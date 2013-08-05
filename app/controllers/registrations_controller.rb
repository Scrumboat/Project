	# app/controllers/my_devise/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController

	def new
		if admin_signed_in? 
			super
		else
			redirect_to('/')
		end
  end

  def create
    super
  end

  def update
    super
  end
end