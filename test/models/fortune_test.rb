# == Schema Information
#
# Table name: fortunes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_fortunes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class FortuneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
