class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  
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
  
  end

  
  def edit
  end

  
  def create
    @comment = current_user.comments.build(comment_params)
    

  
      if @comment.save
        redirect_to @comment, notice: 'Comment was successfully created.' 
      else
         render :new 
    end
  end

 
  def update
    
      if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
      else
        render :edit 
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.' 
      
    end
 

  private
  
    def set_comment
      @comment = Comment.find(params[:id])
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