class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :name, on: :create, message: "must be unique"

    has_many :orders
    has_many :order_items, through: :orders
end
