class User < ApplicationRecord
    has_secure_password
    validates_presence_of :username, on: :create, message: "can't be blank"
    validates_uniqueness_of :username, on: :create, message: "must be unique"
    validates_format_of :username, with: /\A[a-z0-9]+\z/, on: :create, message: "is invalid"
    has_many :orders
    has_many :order_items, through: :orders
  
end
