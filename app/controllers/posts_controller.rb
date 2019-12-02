class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize
   before_action :check_admin, only: [:destroy, :edit]

  # GET /posts
  # GET /posts.json
  def index
    # @posts = Post.all
  
    # @posts =Post.order(:user_name).page params[:page]

    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).page params[:page]

  end
  def home
    @posts = Post.all
    
   end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @commentings = @post.commentings
    @commenting = @post.commentings.build
  end

  # GET /posts/new
  def new
        
    @post = current_user.posts.build
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    # @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
#   @post = Post.new(post_params)

#   respond_to do |format|
#     if @post.save
#       format.html { redirect_to @post, notice: 'Post was successfully created.' }
#       format.js { render :index }
#     else
#       format.html { render :new }
#       format.js { render :index }
#     end
#   end
# end
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
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

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_name, :country, :province, :district, :sector, :cell, :village, :telephone_number, :gender, :ID_number, :lost_id_date_or_found_id_date, :post_reason, :confirmation, :property_name, :user_id)
    end

    def check_admin
      unless current_user && current_user.admin? 
        redirect_to posts_path, notice: "only admin can access"

      end
    
    end
end
