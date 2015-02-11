class ApplicationController < ActionController::Base
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
 end
end
