class OrdersController < ApplicationController
    def index
        @orders = current_user.orders
    end

    def show
        byebug
        @order_items = Order.find(params[:id]).order_items
    end

    def create
        @order = Order.new(params[:order])
        if @order.save
          flash[:success] = "Order successfully created"
          redirect_to @order
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    

    def new
        @order = Order.new
    end
end
