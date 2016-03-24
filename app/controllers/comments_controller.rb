class CommentsController < ApplicationController
 
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.save
    redirect_to '/'
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @post
  end
  private
  def comment_params
    params.require(:comment).permit(:thought, :user_id, :post_id)
  end
end
