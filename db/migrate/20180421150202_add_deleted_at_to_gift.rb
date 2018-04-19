class AddDeletedAtToGift < ActiveRecord::Migration[5.1]
  def change
    add_column :gifts, :deleted_at, :datetime, default: nil
    add_index :gifts, :deleted_at
  end
end
