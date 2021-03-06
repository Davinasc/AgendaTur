class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, 
      keys: [
        :user_type,
        :qualification,
        :comission,
        :name,
        :phone,
        :admin
      ])
    devise_parameter_sanitizer.permit(:account_update,
      keys: [
        :name,
        :qualification,
        :comission,
        :phone,
        :admin
      ])
  end
end
