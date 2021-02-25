class UsersController < ApplicationController
    before_action :set_logged_in

    def new
        user = User.new
        render json: user
    end

    def create
        user = User.new(username: params['username']);
        if user.save
            render json: {
                success: true,
                user: user
            }
        else
            render json: {
                success: false, 
                msg: 'Unable to create user'
            }    
        end
    end

    def auth
        user = current_user;
        render json: {
            success: !user.nil?,
            data: user
        };
    end

    def login
        user = User.find_by(username: params['username']);
        if user
            render json: {
                success: true,
                user: user,
                token: create_jwt(user)
            }
        else
            render json: {
                success: false,
                msg: 'Username do not exist'
            }
        end
    end

    def logout
        session[:user_id] = nil;
        render json: {
            success: true
        }
    end

    def validate 
        render json: current_user
    end
end
