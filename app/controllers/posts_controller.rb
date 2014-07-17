class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]
	def index
		@posts = Post.all
	end

	def new
		@posts = Post.new
	end

	def create
		@posts = Post.new post_params
		@posts.user = current_user
		@posts.save
		redirect_to '/posts'
	end

	private

	def post_params
		params[:post].permit(:title, :description, :image)
	end
end
