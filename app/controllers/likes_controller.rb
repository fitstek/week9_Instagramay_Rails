class LikesController < ApplicationController
	def create
		@post = Post.find params[:post_id]
		@post.likes.create!
		WebsocketRails[:likes].trigger(:new, {id: @post.id, new_like_count: @post.likes.count})
		redirect_to posts_path

		rescue
			render json: {message: 'can not like twice'}
	end
end
