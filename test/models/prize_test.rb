# == Schema Information
#
# Table name: prizes
#
#  id          :bigint(8)        not null, primary key
#  user_id     :bigint(8)
#  price       :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string(255)
#  description :string(255)
#
# Indexes
#
#  index_prizes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class PrizeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
