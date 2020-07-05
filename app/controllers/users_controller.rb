class UsersController < ApplicationController

    def new
        @user=User.new
    end

    def create
            @user = User.new(user_params)
            if @user.save
            flash[:success] = "Account created, you can now login"
            redirect_to root_path
        else
            redirect_to new_user_path, alert: "Username already exists!"
        end
    end

    def show
        @user = User.find_by_id(params[:id])
        redirect_to root_path if !@user
    end

    def order_index
        @orders = current_user.orders
        render template: 'orders/index'
    end

    def index
        @users = User.all
        @order = Order.pending
    end

    def edit
        if admin
            @user = User.find(params[:id])
        else
            @user = User.find(params[:id])
            if @user != current_user
                flash[:error] = "Only and admin can change other users details"
                redirect_to user_path(current_user)
            end
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          flash[:success] = "User was successfully updated"
          redirect_to @user
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
    
    

    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :email, :admin)
    end
end
