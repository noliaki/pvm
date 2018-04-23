class AddFortunesCountToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fortunes_count, :int, default: 0
  end
end
