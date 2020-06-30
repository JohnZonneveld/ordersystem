class Order < ApplicationRecord
    has_many :order_items
    has_many :items, through: :order_items
    belongs_to :user

    def self.find_items(no)
        order = Order.find(no)
        
        order.items.each_with_index do |item, index|
            byebug
            hash=item.attributes
            byebug
            hash.merge(quantity: order.order_items[index][:quantity])
        end
    
        byebug
    end

end
