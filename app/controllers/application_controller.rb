require 'jwt'

class ApplicationController < ActionController::API
    include ActionController::Cookies
    include ActionController::RequestForgeryProtection
    @@jwt_password = '1234'
    def current_user
        return nil if session[:user_id].nil?
    
        begin
          User.find(session[:user_id])
        rescue StandardError
          nil
        end
      end

      def create_jwt(user)
        payload = {
          username: user.username,
          id: user.id
        }
        JWT.encode payload, @@jwt_password , 'none'
      end

      def decode_jwt(token)
        JWT.decode token, @@jwt_password , false
      end

      def set_logged_in
        token = request.headers['Authorization'];
        if token.nil?
          session[:user_id] = nil;
        else
          session[:user_id] = decode_jwt(token)[0]["id"];
        end  
      end

end
