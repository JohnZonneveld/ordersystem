class OrderItemsController < ApplicationController

    def create
        byebug
        @order = current_order
        @order.user ||= current_user
		@order_item = @order.order_items.new(order_item_params)
        if @order.save
            flash[:message] = 'Item added to cart'
        end
        render 'items/index'
            		session[:order_id] = @order.id
	end

    def update
    byebug    
		@order = current_order
		@order_item = @order.order_items.find(params[:id])
		@order_item.update_attributes(order_item_params)
        @order_items = @order.order_items
        render "orders/show"
	end

	def destroy
		@order = current_order
		@order_item = @order.order_items.find(params[:id])
		@order_item.destroy
		@order_items = @order.order_items
	end

	private
		def order_item_params
			params.require(:order_item).permit(:item_id, :quantity)
		end

end
