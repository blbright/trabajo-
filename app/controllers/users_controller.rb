class UsersController < ApplicationController

  def profile
   @user = current_user
   @posts = current_user.posts.reverse_order
   @post = Post.new

  end

  def edit
   @user = current_user
  end

  def show
   @user = User.find(params[:id])
   @posts = @user.posts
  end


  def update
     @user = current_user.update_attributes(user_params)
     redirect_to '/profile'
   end

   def destroy
     @user = User.find(params[:id])
     @user.destroy
     redirect_to '/'
   end

   private

   def user_params
    params.require(:user).permit(:name, :email, :experience,:description,:current_position, :avatar)
   end



end
