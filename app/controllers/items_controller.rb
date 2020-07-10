class ItemsController < ApplicationController

    def index
        @items = Item.all.order(:name)
        @order_item = current_order.order_items.new
    end

    def new
        if admin
            @item = Item.new
        else
            flash[:alert] = "Only an admin can add items!"
            redirect_to items_path
        end
    end
    
    def create
        @item = Item.new(item_params)
        if @item.save
            flash[:success] = "Item successfully created"
            redirect_to items_path
        else
            flash[:error] = "Something went wrong"
            render 'new'
        end
    end

    def edit
        if admin
            @item = Item.find_by(id: params[:id])
        else
            flash[:alert] = "Only an admin can change items"
            redirect_to items_path
        end
    end

    def update
        @item = Item.find_by(id: params[:id])
        if @item.update(item_params)
          flash[:success] = "Item was successfully updated"
          redirect_to items_path
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
    def most_popular_items
        @popular_items_top5 = OrderItem.popular_sort.first(5).map{|i| Item.find_by(id: i)}
        @order_item = OrderItem.new
    end

    private

    def item_params
        params.require(:item).permit(:name, :description, :price, :available)
    end
    
    
    
end
