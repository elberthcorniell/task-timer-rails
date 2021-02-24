class ApplicationController < ActionController::API
    def current_user
        return nil if session[:user_id].nil?
    
        begin
          User.find(session[:user_id])
        rescue StandardError
          nil
        end
      end
end
