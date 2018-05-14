# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  gift_id                :bigint(8)
#  fortune_id             :bigint(8)
#  name                   :string(255)
#  thumbnail_file_name    :string(255)
#  thumbnail_content_type :string(255)
#  thumbnail_file_size    :integer
#  thumbnail_updated_at   :datetime
#  team_id                :bigint(8)
#  gifts_count            :integer          default(0)
#  fortunes_count         :integer          default(0)
#  prize_id               :bigint(8)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_fortune_id            (fortune_id)
#  index_users_on_gift_id               (gift_id)
#  index_users_on_prize_id              (prize_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_team_id               (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (fortune_id => fortunes.id)
#  fk_rails_...  (gift_id => gifts.id)
#  fk_rails_...  (prize_id => prizes.id)
#  fk_rails_...  (team_id => teams.id)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "user save" do
    team = Team.new(name: 'Team')

    user = User.new(
      email: 'fuga@example.com',
      password: 'hogefuga',
      team: team
    )

    assert user.save, 'fail to save'
  end

  test "user can send gift" do
    team = Team.new(name: 'Team')

    from_user = User.create(
      email: 'fuga@example.com',
      password: 'hogefuga',
      team: team
    )

    to_user = User.find_by_id(0)

    no_save_user = User.new(
      email: 'hogehoge@example.com',
      password: 'hogefuga',
      team: team
    )

    assert_equal from_user.error_message(from_user), "自分へは送れません"
    assert_equal from_user.error_message(to_user), "送りたい人が存在しないようです"
  end
end
