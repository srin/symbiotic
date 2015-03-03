class CommentsController < ApplicationController
  before_action :set_comments, only: [:destroy]
  before_action :authenticate_user!, except: [:index] 
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
        format.html { redirect_to @post, notice: 'Answer was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
        # AnswerMailer.answer_confirm(@post, @comment).deliver_now  

      else
        format.html { redirect_to @post, notice: 'Sorry! Please try again. Your answer was unsuccessfully saved' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
    	@comment.destroy
    		respond_to do |format|
      	format.html { redirect_to :back, notice: 'Answer was successfully deleted.' }
      	format.json { head :no_content }
    	end
  	end


  
  def upvote
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      if current_user.voted_for? @comment
        flash[:notice] = "You cannot vote more than once"
      
      else
      @comment.upvote_by current_user 
      @comment.user.increase_karma
      @comment.post.increase_tally
      flash[:success] = "You've upvoted"
      end
      
      redirect_to @post       
    end

  def downvote
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      if current_user.voted_for? @comment
      flash[:notice] = "You cannot vote more than once"
      else
      @comment.downvote_by current_user
      @comment.user.decrease_karma
      flash[:success] = "You've downvoted"
    end
      
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
