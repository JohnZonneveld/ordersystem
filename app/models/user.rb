class User < ApplicationRecord
    has_secure_password
    validates_presence_of :username, on: [:create, :update], message: "can't be blank"
    validates_uniqueness_of :username, on: :create, message: "must be unique"
    has_many :orders, :dependent => :delete_all
    has_many :order_items, through: :orders
  
end
