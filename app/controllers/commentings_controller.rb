class CommentingsController < ApplicationController
  # It is an action to save and post comments
  def create
    # # Search Blog from the parameter value and build it as comments linked to Blog.
    @post = Post.find(params[:post_id])
    @commenting = @post.commentings.build(commenting_params)
    # Change the format according to client request
    respond_to do |format|
      if @commenting.save
        format.js { render :index }
      else
        format.html { redirect_to post_path(@post), notice: 'Post failed...' }
      end
    end
  end

  private
  # Strong parameter
  def commenting_params
    params.require(:commenting).permit(:post_id, :content)
  end
end