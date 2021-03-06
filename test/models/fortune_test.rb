# == Schema Information
#
# Table name: fortunes
#
#  id           :bigint(8)        not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  message      :string(255)
#  from_user_id :bigint(8)
#  user_id      :bigint(8)
#  deleted_at   :datetime
#
# Indexes
#
#  index_fortunes_on_deleted_at    (deleted_at)
#  index_fortunes_on_from_user_id  (from_user_id)
#  index_fortunes_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (from_user_id => users.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class FortuneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
