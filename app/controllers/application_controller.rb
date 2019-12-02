class ApplicationController < ActionController::Base
    def authorize
        redirect_to  new_user_registration_path, alert: "" if current_user.nil?
    end


end