class AddMessageToFortune < ActiveRecord::Migration[5.1]
  def change
    add_column :fortunes, :message, :string
  end
end
