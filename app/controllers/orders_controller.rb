class OrdersController < ApplicationController
    def index
        @orders = current_user.orders
    end

    def show
        byebug
        @order_info = Order.find_items(params[:id])
        
        byebug
        
    end

    def new
        @order = Order.new
    end
end
