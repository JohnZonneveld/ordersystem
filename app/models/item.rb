class Item < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items
    
    validates_presence_of :name, on: :create, message: "can't be blank"
    validates_presence_of :description, on: :create, message: "can't be blank"
    validates_presence_of :price, on: :create, message: "can't be blank"
end
