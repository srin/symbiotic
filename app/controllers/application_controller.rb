class ApplicationController < ActionController::Base
  before_filter :list_posts
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_in) << :name
   devise_parameter_sanitizer.for(:sign_up) << :name
   devise_parameter_sanitizer.for(:account_update) << :name
   devise_parameter_sanitizer.for(:sign_in) << :company
   devise_parameter_sanitizer.for(:sign_up) << :company
   devise_parameter_sanitizer.for(:account_update) << :company
   devise_parameter_sanitizer.for(:sign_in) << :SRA_number
   devise_parameter_sanitizer.for(:sign_up) << :SRA_number
   devise_parameter_sanitizer.for(:account_update) << :SRA_number
   devise_parameter_sanitizer.for(:sign_in) << :verified
   devise_parameter_sanitizer.for(:sign_up) << :verified
   devise_parameter_sanitizer.for(:account_update) << :verified
   devise_parameter_sanitizer.for(:sign_in) << :is_solicitor
   devise_parameter_sanitizer.for(:sign_up) << :is_solicitor
   devise_parameter_sanitizer.for(:account_update) << :is_solicitor
   devise_parameter_sanitizer.for(:sign_in) << :image
   devise_parameter_sanitizer.for(:sign_up) << :image
   devise_parameter_sanitizer.for(:account_update) << :image
 end

  
end

  def list_posts
  @q = Post.ransack(params[:q])
  end

  private

  def make_action_mailer_use_request_host_and_protocol
    ActionMailer::Base.default_url_options[:protocol] = request.protocol
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
