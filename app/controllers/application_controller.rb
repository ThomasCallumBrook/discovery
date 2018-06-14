class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  private

    def require_login
      unless current_user
        redirect_to new_user_session_path
      end
    end
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:
        [:name, :email, :password,
        :password_confirmation, :current_password]
      )
    end
end
