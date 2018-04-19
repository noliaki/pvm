# == Schema Information
#
# Table name: fortunes
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  message      :string(255)
#  from_user_id :integer
#
# Indexes
#
#  index_fortunes_on_from_user_id  (from_user_id)
#  index_fortunes_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (from_user_id => users.id)
#  fk_rails_...  (user_id => users.id)
#

class Fortune < ApplicationRecord
  belongs_to :user
  belongs_to :from_user, class_name: 'User'
end
