class CommentingsController < ApplicationController
  
  before_action :find_post
  before_action :find_commenting, only: [:destroy, :edit , :update]
  def create
  	@commenting = @post.commentings.create(params[:commenting].permit(:content))
@commenting.save
if @commenting.save
  redirect_to post_path(@post)
else
  redirect_to post_path(@post)
end
end

def destroy
@commenting.destroy
redirect_to post_path(@post)
end

def edit
end
def update
  if @commenting.update(params[:commenting].permit(:content))
  redirect_to post_path(@post)
else
  render 'edit'
end
end
private
def find_post

  @post = Post.find(params[:post_id])
end

def find_commenting
  @commenting = @post.commentings.find(params[:id])
end
end