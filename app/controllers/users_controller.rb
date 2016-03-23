class UsersController < ApplicationController
  def profile
   @user = current_user
   @posts = current_user.posts.reverse_order
   @post = Post.new

  end

  def edit

  end

  def show
  @post = Post.find(params[:id])
 end


end
