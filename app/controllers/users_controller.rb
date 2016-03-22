class UsersController < ApplicationController
  def profile
   @user = current_user
   @posts = current_user.posts
  end

  def edit
  end
end
