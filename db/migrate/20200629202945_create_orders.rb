class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :total_price, precision: 8, scale: 2
      t.boolean :approved
      t.text :description

      t.timestamps
    end
  end
end
