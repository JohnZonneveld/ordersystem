class UsersController < ApplicationController
    before_action :redirect_not_logged_in, only: :show

    def new
        @user=User.new
    end

    def create
        user = User.find_or_create_by(username: user_params[:username])
        byebug
        if user
            user.update(user_params)
            byebug
            user.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    def show
        @user = User.find_by_id(params[:id])
        redirect_to root_path if !@user
    end
    

    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :email, :admin)
    end
end
