class UsersController < ApplicationController

  def profile
   @user = current_user
   @posts = current_user.posts.reverse_order
   @post = Post.new

  end

  def create
        @user = User.new(user_params)
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        flash[:success] = "Please confirm your email address to continue"
        redirect_to root_url
      else
        flash[:error] = "Ooooppss, something went wrong!"
        render 'new'
      end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
      Please sign in to continue."
      redirect_to signin_url
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
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
    params.require(:user).permit(:name, :email, :experience,:description,:current_position, :avatar, :username)
   end



end
