# == Schema Information
#
# Table name: prize_users
#
#  id         :bigint(8)        not null, primary key
#  prize_id   :bigint(8)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_prize_users_on_prize_id  (prize_id)
#  index_prize_users_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (prize_id => prizes.id)
#  fk_rails_...  (user_id => users.id)
#

class PrizeUser < ApplicationRecord
  belongs_to :prize
  belongs_to :user
end
