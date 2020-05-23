class ApplicationController < ActionController::Base
	  before_action :configure_permitted_parameters, if: :devise_controller?



    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    end


    def after_sign_in_path_for(resource)
      user_path(current_user.id)
    end


    def after_sign_out_path_for(resource_or_scope)
      root_path
    end

  # ログイン後のリダイレクト先
  # def after_sign_in_path_for(resource)
  # user_page_path(resource.id)
  # end

    # def after_sign_out_path_for(resource)
      # home_path, notice: "Signed out successfully."
    # end

end
