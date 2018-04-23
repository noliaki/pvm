# == Schema Information
#
# Table name: gifts
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
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

require 'test_helper'

class GiftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
