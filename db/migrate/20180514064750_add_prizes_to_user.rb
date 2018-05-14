class AddPrizesToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :prize, index: true, foreign_key: true
  end
end
