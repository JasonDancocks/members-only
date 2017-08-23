class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:sessions][:email].downcase)
		if user && user.authenticate(params[:sessions][:password])
			sign_in user
			flash[:success] = "Logged in!"
			redirect_to root_path
		else
		 	flash[:danger] = 'Invalid email/password combination'
      render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end

end
