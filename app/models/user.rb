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
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_fortune_id            (fortune_id)
#  index_users_on_gift_id               (gift_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_team_id               (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (fortune_id => fortunes.id)
#  fk_rails_...  (gift_id => gifts.id)
#  fk_rails_...  (team_id => teams.id)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :team

  has_many :gifts
  has_many :fortunes

  # paperclip
  has_attached_file :thumbnail, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/user/thumb/thumb-1.png"
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\z/

  def has_fortunes
    fortunes.with_deleted.order("created_at DESC")
  end

  def error_message to_user
    return "自分へは送れません" if self.equal? to_user
    return "送りたい人が存在しないようです" if !present_user? to_user
    return "同じ月に同じ人には送れません" if sent_same_user_in_month? to_user
  end

  def present_user? to_user
    to_user.present?
  end

  def sent_same_user_in_month? to_user
    beginning_month = Time.zone.today.beginning_of_month
    end_month = Time.zone.today.end_of_month

    gifts.only_deleted.where(
      to_user_id: to_user.id,
      deleted_at: beginning_month..end_month
    ).present?
  end
end
