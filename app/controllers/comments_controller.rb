class CommentsController < ApplicationController
  before_action :set_comments, only: [:destroy]
  before_action :authenticate_user!, except: [:index, :show] 
  before_action :correct_user, only: [:edit, :update, :destroy]



  	def new
  		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comments_params)
		@comment.user = current_user
  		
  	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comments_params)
		@comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
        AnswerMailer.answer_confirm(@post, @comment).deliver_now  

      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
    	@comment.destroy
    		respond_to do |format|
      	format.html { redirect_to :back, notice: 'Comment was successfully destroyed.' }
      	format.json { head :no_content }
    	end
  	end


  
  def upvote
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      if current_user.voted_for? @comment
      
      else
      @comment.upvote_by current_user 
      @comment.user.increase_karma
      @comment.post.increase_tally
      end
      flash[:success] = "You've upvoted"
      redirect_to @post       
    end

  def downvote
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      if current_user.voted_for? @comment
      
      else
      @comment.downvote_by current_user
      @comment.user.decrease_karma
    end
      flash[:success] = "You've downvoted"
      redirect_to @post     
      
    end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comments
      @comment = Comment.find(params[:id])
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to posts_path, notice: "Not authorized to edit this post" if @comment.nil?
    end

        # Never trust parameters from the scary internet, only allow the white list through.
    def comments_params
      params.require(:comment).permit(:post_id, :body, :user_id, :clarification)
    end
end
