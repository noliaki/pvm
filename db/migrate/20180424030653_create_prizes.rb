class CreatePrizes < ActiveRecord::Migration[5.1]
  def change
    create_table :prizes do |t|
      t.references :user, foreign_key: true
      t.integer :price, default: 0

      t.timestamps
    end
  end
end
