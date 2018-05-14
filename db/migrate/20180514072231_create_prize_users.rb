class CreatePrizeUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :prize_users do |t|
      t.references :prize, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
