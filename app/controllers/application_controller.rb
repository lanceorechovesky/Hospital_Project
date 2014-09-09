class ApplicationController < ActionController::Base
  # Next i need to add error messagaes to the validation!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :nickname) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :nickname, :current_password) }
  end

  def user_email
    @user_email = User.find params[:email]
  end
  
end
