class ApplicationController < ActionController::Base
    helper ApplicationHelper
    helper_method :current_user, :logged_in?, :admin, :order_approved?

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def admin
        current_user.admin
    end

    def logged_in?
        !!session[:user_id]
    end

    # def redirect_not_logged_in
    #     redirect_to root_path if !logged_in?
    # end

    def current_order
		if session[:order_id]
			Order.find(session[:order_id])
		else
			Order.new
		end
    end
    
    def order_approved?
        @order.approved
    end
end
