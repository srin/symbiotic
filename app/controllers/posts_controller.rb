class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :recent, :search, :show_all, :corporate, :ip, :employment, :real_estate, :venture_cap] 
  before_action :correct_user, only: [:edit, :update, :destroy]
  has_scope :recent, :type => :boolean
  has_scope :popular, :type => :boolean
  has_scope :unanswered, :type => :boolean

  # GET /posts
  # GET /posts.json
    def index
    
    q = params[:q]
    @posts = Post.search(description_or_title_or_comments_body_cont: q).result.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
     # @posts = @q.result.includes(:comments).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    
    end

    def search
    q = params[:q]
    @posts = Post.search(description_or_title_or_comments_body_cont: q).result.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    
    end

    def show_all
    @posts = apply_scopes(Post).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    end

    def corporate
    @posts = apply_scopes(Post).where(category_id: 1).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    end

    def ip
    @posts = apply_scopes(Post).where(category_id: 2).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    end

  def employment
    @posts = apply_scopes(Post).where(category_id: 3).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def real_estate
    @posts = apply_scopes(Post).where(category_id: 5).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def venture_cap
    @posts = apply_scopes(Post).where(category_id: 6).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

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
      format.html { redirect_to posts_url, notice: 'Post was successfully deleted.' }
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
      params.require(:post).permit(:title, :description, :category_id, :anonymous)
    end

end
