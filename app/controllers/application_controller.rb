class ApplicationController < ActionController::Base
	  before_action :authenticate_user!
	  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

  # ログイン後のリダイレクト先
  # def after_sign_in_path_for(resource)
  # user_page_path(resource.id)
  # end

end
