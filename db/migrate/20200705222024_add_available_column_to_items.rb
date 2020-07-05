class AddAvailableColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :available, :boolean, :default => true
    #Ex:- :default =>''
  end
end
