class AddGiftAndFortuneToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :gift, index: true, foreign_key: true
    add_reference :users, :fortune, index: true, foreign_key: true
  end
end
