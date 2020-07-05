class Order < ApplicationRecord
    has_many :order_items
    has_many :items, through: :order_items
    belongs_to :user
    before_save :set_total_price

    scope :pending, -> { where(approved: false) }

    def total
        order_items.collect {|order_item| order_item.valid? ? order_item.item.price*order_item.quantity : 0}.sum
    end

    def sorted_orders
        current_user.orders.order("created_at DESC")
    end
    

	private
		def set_total_price
			self[:total_price] = total
        end
        
        

end
