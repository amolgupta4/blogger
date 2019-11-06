class BlogsController < ApplicationController
	before_action :find_blog, only: [:show, :edit, :update, :destroy, :upvote]

	def index
			
		@blogs = Blog.all.order("created_at DESC")			
	end

	def show
		
	end
	def new
		@blog = current_user.blogs.build	
	end
	def create
		@blog = current_user.blogs.build	(blog_params)
			if @blog.save
			redirect_to @blog, notice: "successfully posted"
		else 
			render 'new'
		end	
	end
	def edit
		
	end
	def update
		if @blog.update(blog_params)
			redirect_to @blog, notice: " Blog was updated..!"
		else 
			render 'edit'
		end
		
	end
	def destroy
		@blog.destroy
		redirect_to root_path	
	end
	def upvote
		@blog.upvote_by current_user
		redirect_back fallback_location: root_path	
	end
	private

	def blog_params
		params.require(:blog).permit(:title, :description, :image)
		
	end
	def find_blog
		@blog = Blog.find(params[:id])
	end
end
