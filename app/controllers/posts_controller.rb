class PostsController < ApplicationController


 def index
  @posts = Post.all
 end
 def new
  @post = Post.new
 end

 def create
  @post = Post.new(post_params)
  @post.save
  redirect_to @post
 end

 def show
  @post = Post.find(params[:id])
 end

def destroy
  @post = Post.find(params[:id])
end

def edit
  @post = Post.find(params[:id])
end

def update
  respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
end

 private

 def post_params
  params.require(:post).permit(:user_id,:content)
 end

end
