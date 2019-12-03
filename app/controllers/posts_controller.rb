class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize
   before_action :check_admin, only: [:destroy, :edit]

  def index
  

    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).page params[:page]

  end
  def home
    @posts = Post.all
    
   end


  def show
    @commentings = @post.commentings
    @commenting = @post.commentings.build
  end


  def new
        
    @post = current_user.posts.build
    @post = Post.new
  end

  def edit
  end


  def create
    @post = current_user.posts.build(post_params)


 
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.' 
      else
       render :new 
    end
  end

  def update
    
      if @post.update(post_params)
         redirect_to @post, notice: 'Post was successfully updated.' 
      else
       render :edit 
    end
  end

  def destroy
    @post.destroy
   
       redirect_to posts_url, notice: 'Post was successfully destroyed.' 
    
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:user_name, :country, :province, :district, :sector, :cell, :village, :telephone_number, :gender, :ID_number, :lost_id_date_or_found_id_date, :post_reason, :confirmation, :property_name, :user_id)
    end

    def check_admin
      unless current_user && current_user.admin? 
        redirect_to posts_path, notice: "only admin can access"

      end
    
    end
end