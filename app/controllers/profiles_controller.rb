class ProfilesController < ApplicationController
  before_action :set_user, only: [:lawyerprofile]

  def myprofile

  	@user = current_user
  	@posts = @user.posts
  	@comments = @user.comments
  end

  def lawyerprofile
  	@comments = @user.comments
  end



    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user])
    end
end
