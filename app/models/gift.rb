# == Schema Information
#
# Table name: gifts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  deleted_at :datetime
#
# Indexes
#
#  index_gifts_on_deleted_at  (deleted_at)
#  index_gifts_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Gift < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
end
