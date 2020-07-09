class OrdersController < ApplicationController
	def index
		if admin
			if params[:user_id]
				@user=User.find(params[:user_id])
				@orders = @user.orders.where(approved: false).order("created_at DESC")
			else
				@orders = Order.all.order("created_at DESC")
			end
		else
			@orders = current_user.orders.order("created_at DESC")
		end
    end

    def show
		@order = Order.find_by(id: params[:id])
		if logged_in? && (current_user.orders.include?(@order)  || admin)
			session[:order_id] = @order.id
			render 'show'
		else
			flash[:error] = "Illegal action, you were redirect to the homepage"
			redirect_to root_path
		end
        
    end

	def update
		@order = Order.find(params[:id])
		#only path here is 'approve order'
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
		@order = Order.find_by(id: params[:id])
		if logged_in? && current_user.orders.include?(@order)
			@order_items_size = @order.order_items.size
			byebug
			@order_items = @order.order_items.sort {|a, b| a.item.name <=> b.item.name}
			render 'edit'
		else
			flash[:error] = "Illegal action, you were redirect to the homepage"
			redirect_to root_path
		end
	end

	def new
		if logged_in?
			byebug
			session[:order_id] = nil
			@order = Order.new
			if current_user.admin
				@order.user = User.find_by(id: params[:user_id])
				@order.save!
				session[:order_id] = @order.id
			end
			# 	@order.user = current_user
			# 	@order.save!
			# end
			# flash[:success] = "Order #{@order.id} created"
			redirect_to items_path
		else
			flash[:alert] = "You need to be signed in to add a new order"
		end
	end

	def destroy
		@order = Order.find(params[:id])
		if @order.destroy
			flash[:success] = 'Order was successfully deleted.'
			redirect_to orders_url
		else
			flash[:error] = 'Something went wrong'
			redirect_to orders_url
		end
	end
	

end
