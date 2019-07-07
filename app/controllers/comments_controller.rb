class CommentsController < ApplicationController
  def create
    @comment.create(text: comments_params[:text], blog_id: comments_params[:blog_id], user_id: current_user.id)
    redirect_to "/blogs/#{commetn.blog.id}"
  end

  private
  def comments_params
    params.permit(:text, :blog_id)
  end
end