class OrderItem < ApplicationRecord
    belongs_to :item
    belongs_to :order

    scope :most_popular, ->  {(group(:item_id).sum(:quantity)).sort_by{|k,v| v}.reverse.map(&:first).first}
end
