class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def after_sign_in_path_for(resource)
        if resource_class == EndUser
            end_users_my_page_path
        else
            admin_path
        end
    end

    def after_sign_out_path_for(resource)
        if resource_class == EndUser
            root_path
        else
            new_admin_session_path
        end
    end  

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:last_name_kana,:first_name_kana,
            :postal_code,:address,:telephone_number])
    end
end
