class AddFromUserTofotune < ActiveRecord::Migration[5.1]
  def change
    add_reference :fortunes, :from_user, foreign_key: {to_table: :users}
  end
end
