# == Schema Information
#
# Table name: prizes
#
#  id                     :bigint(8)        not null, primary key
#  user_id                :bigint(8)
#  price                  :integer          default(0)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  thumbnail_file_name    :string(255)
#  thumbnail_content_type :string(255)
#  thumbnail_file_size    :integer
#  thumbnail_updated_at   :datetime
#  name                   :string(255)
#  description            :string(255)
#
# Indexes
#
#  index_prizes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Prize < ApplicationRecord
  belongs_to :user, optional: true

  # paperclip
  has_attached_file :thumbnail, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/prize/default.jpg"
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\z/
end
