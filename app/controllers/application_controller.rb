class ApplicationController < ActionController::Base
    protect_from_forgery

    alias :std_redirect_to :redirect_to
    def redirect_to(*args)
        flash.keep
        std_redirect_to *args
    end

    before_action :configure_permitted_parameters, if: :devise_controller?


def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])

end
    # before_action :configure_permitted_parameters, if: :devise_controller?

    # def configure_permitted_parameters
    #     devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    #     devise_parameter_sanitizer.permit(:account_update, keys: [:name])

    #     # devise_parameter_sanitizer.permit(:sign_in) do |user_params|
    #     #   user_params.permit(:name, :email)
    #   end
    # after_filter :store_action

    # def store_action
    # return unless request.get? 
    # if (request.path != "/users/sign_in" &&
    #     request.path != "/users/sign_up" &&
    #     request.path != "/users/password/new" &&
    #     request.path != "/users/password/edit" &&
    #     request.path != "/users/confirmation" &&
    #     request.path != "/users/sign_out" &&
    #     !request.xhr?) # don't store ajax calls
    #     store_location_for(:user, request.fullpath)
    # end
    # end


    # def after_sign_out_path_for(resource_or_scope)
    #     user_path
    # end

end
