class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		#Sign the user in and redirect t o the user's show page should be here.
		else
		 	flash.now[:error] = 'Invalid email/password combination' # this code isn't quite right
		render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
