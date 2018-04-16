class AddAttachmentThumbnailToTeams < ActiveRecord::Migration[5.1]
  def self.up
    change_table :teams do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :teams, :thumbnail
  end
end
