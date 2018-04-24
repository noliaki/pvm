class AddToUserToGifts < ActiveRecord::Migration[5.1]
  def change
    add_reference :gifts, :to_user, foreign_key: {to_table: :users}
  end
end
