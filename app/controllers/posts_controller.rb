class PostsController < ApplicationController
	before_action :signed_in_user , only: [:new, :create]

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id

		if @post.save
			flash[:success] = 'Post created!'
			redirect_to root_path
		else
			flash.now[:danger] = 'Post failed'
			render 'new'
		end
	end

	def index
		@posts = Post.all
	end


	private

	def signed_in_user
		redirect_to signin_path unless signed_in?
	end

	def post_params
		params.require(:post).permit(:title, :body)
	end
end

