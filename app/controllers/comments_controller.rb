class CommentsController < ApplicationController
  before_action :set_commenting, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  before_action :check_admin, only: [:destroy, :edit]
 
  def index
    @comments = Comment.all
  end

  def show
    
  end


  def new
    @comment = Comment.new(params[:comment])
    @comment = current_user.comments.build
    # @comment = Comment.new
  end

 
  def edit
  end

  def create
    @comment = current_user.comments.build(comment_params)
    # @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   
    def set_commenting
      @commenting = Commenting.find(params[:id])
    end

   
    def comment_params
      params.require(:comment).permit(:name, :email , :found_id_date, :feedback, :user_id)
    end
    def check_admin
      unless current_user && current_user.admin? 
        redirect_to comments_path, notice: "only admin has permission"

      end
    
    end
end
