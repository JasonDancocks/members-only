class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:sessions][:email].downcase)
		if user && user.authenticate(params[:sessions][:password])
			log_in user
			redirect_to user
		else
			redirect dfhdgh
		end



		
	end

	def delete
		sign_out
	end

end
