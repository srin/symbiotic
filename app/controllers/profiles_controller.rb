class ProfilesController < ApplicationController
	before_action :set_user, only: [:lawyerprofile]


  def myprofile

  	@user = current_user
  	@posts = @user.posts.paginate(:page => params[:page], :per_page => 10)
  	@comments = @user.comments.paginate(:page => params[:page], :per_page => 10)
  end

  def lawyerprofile
  	@comments = @user.comments.paginate(:page => params[:page], :per_page => 10)
  end



    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user])
    end
end
