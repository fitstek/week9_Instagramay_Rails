class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]
	def index
		@posts = Post.all.order(created_at: :desc)
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

	def show
		@post = Post.find params[:id]
	end

	private

	def post_params
		params[:post].permit(:title, :description, :image, :tag_names, :address)
	end
end
