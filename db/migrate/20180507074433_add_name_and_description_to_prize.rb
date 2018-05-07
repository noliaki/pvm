class AddNameAndDescriptionToPrize < ActiveRecord::Migration[5.1]
  def change
    add_column :prizes, :name, :string
    add_column :prizes, :description, :string
  end
end
