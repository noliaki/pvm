class AddUserIdToGift < ActiveRecord::Migration[5.1]
  def change
    add_reference :gifts, :user, index: true, foreign_key: true
  end
end
