module PostsHelper
	def get_name(user_id)
		user = User.find(user_id)
		user.name
	end
end
