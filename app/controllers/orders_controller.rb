class OrdersController < ApplicationController
	def index
		if current_user.admin
			if params[:user_id]
				@user=User.find(params[:user_id])
				@orders = @user.orders.pending
			else
				@orders = Order.all
			end
		else
			@orders = current_user.orders
		end
    end

    def show
		@order = Order.find(params[:id])
		if logged_in? && (current_user.orders.include?(@order)  || current_user.admin)
			session[:order_id] = @order.id
			render 'show'
		else
			flash[:error] = "Illegal action, you were redirect to the homepage"
			redirect_to root_path
		end
        
    end

	def update
		@order = Order.find(params[:id])
		@order.approved = true
		if @order.save
		  flash[:success] = "Order was successfully updated"
		  redirect_to @order
		else
		  flash[:error] = "Something went wrong"
		  render 'edit'
		end
	end
	
	def edit
		@order = Order.find(params[:id])
		if logged_in? && current_user.orders.include?(@order)
			render 'edit'
		else
			flash[:error] = "Illegal action, you were redirect to the homepage"
			redirect_to root_path
		end
	end

	def new
		@order = Order.new
		@order.user = User.find(params[:user_id])
		@order.save
		current_order
		session[:order_id] = @order.id
	end

end
