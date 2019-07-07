class BlogsController < ApplicationController

  before_action :move_to_index, except: [:index]

  def index
    @blogs = Blog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(text: blogs_params[:text], user_id: current_user.id)
    redirect_to blog_path(@blog)
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.destroy
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @comments = @blog.comments.includes(:user)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blogs_params)
    end
  end

  private
  def blogs_params
    params.require(:blog).permit(:text)
  end

  def move_to_index
    redirect_to :action => "index" unless user_signed_in?
  end
end
