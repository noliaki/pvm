# == Schema Information
#
# Table name: gifts
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#  deleted_at :datetime
#  to_user_id :bigint(8)
#
# Indexes
#
#  index_gifts_on_deleted_at  (deleted_at)
#  index_gifts_on_to_user_id  (to_user_id)
#  index_gifts_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (to_user_id => users.id)
#  fk_rails_...  (user_id => users.id)
#

class Gift < ApplicationRecord
  acts_as_paranoid

  belongs_to :user, counter_cache: true
  belongs_to :to_user, class_name: 'User', optional: true
end
