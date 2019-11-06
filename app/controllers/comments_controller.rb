class CommentsController < ApplicationController
	before_action :find_blog
	before_action :find_comment, only: [:show, :edit, :update, :destroy]
	def new
		@comment = Comment.new
	end
	def create
		
		@comment = Comment.new(comment_params)
		@comment.blog_id = @blog.id
		@comment.user_id = current_user.id

		if @comment.save
			redirect_to blog_path(@blog)
		else
			render 'new'
		end
	end
	def edit
		
	end
	def update
		if @comment.update(comment_params)
			redirect_to blog_path(@blog)
		else
			render 'edit'
		end	

	end
	def destroy
		@comment.destroy
		redirect_to blog_path(@blog)
		
	end
	
	private

	def comment_params
		params.require(:comment).permit(:comment)
	end

	def find_blog
		@blog = Blog.find(params[:blog_id])
	end
	def find_comment
		@comment = Comment.find(params[:id])
	end
end
