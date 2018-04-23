class AddGiftsCounterToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :gifts_count, :int, default: 0
  end
end
