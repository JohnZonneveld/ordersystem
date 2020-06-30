class OrderItemsController < ApplicationController

    def create
    byebug
        @order = current_order
        byebug
        orderitem = @order.order_items.find_by(item_id: params[:order_item][:item_id])
        if orderitem
            orderitem[:quantity] = orderitem.quantity.to_i + params[:order_item][:quantity].to_i
            orderitem.save
        else
            @item = @order.order_items.new(order_item_params)
            @order.user = current_user
        end
        @order.save
        flash[:success] = "Item added to your order #{current_order.id}!!"
        session[:order_id] = @order.id
        redirect_to items_path
	end

    def update   
        byebug
		@order = current_order
		@order_item = @order.order_items.find(params[:id])
		@order_item.update_attributes(order_item_params)
        # @order_items = @order.order_items
        flash[:success] = "Quantity of #{@order_item.item.name} updated!"
        redirect_to order_path(@order)
	end

    def destroy
        byebug
		@order = current_order
		@orderitem = @order.order_items.find(params[:id])
        @orderitem.destroy
        byebug
        if @order.order_items.size == 0
            @order.destroy
            session[:order_id]= nil
            flash[:success] = "Item deleted and empty order removed!"
            redirect_to root_path
        else
           @order.save
           flash[:success] = "Item: '#{@orderitem.item.name}' deleted from your order!"
           redirect_to order_path(current_order)
        end
        
		
	end

	private
		def order_item_params
			params.require(:order_item).permit(:item_id, :quantity)
		end

end
