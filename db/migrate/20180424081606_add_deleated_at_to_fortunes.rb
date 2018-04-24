class AddDeleatedAtToFortunes < ActiveRecord::Migration[5.1]
  def change
    add_column :fortunes, :deleted_at, :datetime, default: nil
    add_index :fortunes, :deleted_at
  end
end
