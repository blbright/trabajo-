class PostsController < ApplicationController

 def index
  @posts = Post.all
  if params[:search]
    @posts = Post.search(params[:search]).reverse_order
  else
    @posts = Post.all.reverse_order
  end
  @post = Post.new

 end

 def create
  @post = Post.new(post_params)
  @post.save
  redirect_to :back
 end

 def edit
  @post = Post.find(params[:id])
  session[:return_to] ||= request.referer
 end

 def vote
   @post = Post.find(params[:id])
   if @post.votes.create(user: current_user)
     redirect_to(posts_path)
   else
     redirect_to(posts_path)
   redirect_to :back
 end

 def update
  @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to session.delete(:return_to)}
      else
        format.html { render :edit }
      end
    end
  end

  def show
   @post = Post.find(params[:id])
   @comments = @post.comments
   @user = @post.user  end
  end




 def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to :back
 end

 private

 def post_params
  params.require(:post).permit(:user_id,:content)
 end
end
