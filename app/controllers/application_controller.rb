class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	def log_in(user)
		user.set_remember_token
		cookies.permanent[:remember_token] = user.remember_token
		current_user=(user)
	end

	def current_user
		@current_user ||= User.find_by(remember_token: cookies[:remember_token])

		if @current_user.nil?
			nil
		else
			@current_user
		end
	end

	def current_user=(user)
		@current_user = user
	end

	def sign_out

		@current_user = nil
		cookies.delete[:remember_token]
	end

end
