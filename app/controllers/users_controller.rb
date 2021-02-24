class UsersController < ApplicationController
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

    def login
        user = User.find_by(username: params['username']);
        if user
            session[:user_id] = user.id;
            render json: {
                success: true,
                user: user
            }
        else
            render json: {
                success: false,
                msg: 'Username do not exist'
            }
        end
    end

    def validate 
        render json: current_user
    end
end
