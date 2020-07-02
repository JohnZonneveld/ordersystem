class OrderItemsController < ApplicationController

    def create
        if logged_in?
            @order = current_order
            orderitem = @order.order_items.find_by(item_id: params[:order_item][:item_id])
            # if orderitem already exists in order add quantities together, else create new orderitem
            if orderitem
                orderitem[:quantity] = orderitem.quantity.to_i + params[:order_item][:quantity].to_i
                orderitem.save
            else
                @item = @order.order_items.new(order_item_params)
                @order.user ||= current_user
                session[:order_id] = @order.id
            end
            @order.save
            flash[:success] = "Item added to your order #{current_order.id}!!"
        else
            flash[:error] = "You need to be logged in to add items to order"
        end
        redirect_to items_path
	end

    def update   
        @order = current_order
        if !@order.approved
		    @order_item = @order.order_items.find(params[:id])
		    @order_item.update_attributes(order_item_params)
            @order.save
            flash[:success] = "Quantity of #{@order_item.item.name} updated!"
            redirect_to order_path(@order)
        else
            flash[:alert] = "Order has been approved and can not be changed!"
            redirect_to order_path(current_order)
        end
        
	end

    def destroy
        @order = current_order
        if !@order.approved
		    @orderitem = @order.order_items.find(params[:id])
            @orderitem.destroy
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
        else
            flash[:error] = "Order has been approved and can not be deleted!"
            redirect_to order_path(current_order)
        end
	end

	private
		def order_item_params
			params.require(:order_item).permit(:item_id, :quantity)
		end

end
