class AddThumbnailColumnsToPrizes < ActiveRecord::Migration[5.1]
  def up
    add_attachment :prizes, :thumbnail
  end

  def down
    remove_attachment :prizes, :thumbnail
  end
end
