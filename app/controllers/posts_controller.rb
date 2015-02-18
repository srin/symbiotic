class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :recent, :popular, :unanswered] 
  before_action :correct_user, only: [:edit, :update, :destroy]
  has_scope :category 
  has_scope :recent, :type => :boolean
  has_scope :popular, :type => :boolean
  has_scope :unanswered, :type => :boolean

  # GET /posts
  # GET /posts.json
  #   def index
  #   if params[:category].blank?
  #     @posts = @q.result.includes(:comments).order("created_at DESC")
  #     @heading = ""
  #   else
  #     @category_id = Category.find_by(name: params[:category]).id
  #     @posts = @q.result.includes(:comments).where(category_id: @category_id).order("created_at DESC")
  #     @heading = "- " + Category.find_by(name: params[:category]).name
  #   end
  # end

  def index
    @posts = @q.result.includes(:comments).order("created_at DESC")
    @posts = apply_scopes(Post).all
    @scope = current_scopes

  end

  def recent

    @posts = Post.recent
    render action: :index
  end

  def popular
    @posts = Post.popular
    render action: :index
    
  end

  def unanswered
    @posts = Post.unanswered
    render action: :index
    
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end
  

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)

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

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to posts_path, notice: "Not authorized to edit this post" if @post.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :category_id)
    end

end
