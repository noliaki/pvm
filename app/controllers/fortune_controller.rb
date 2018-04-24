class FortuneController < ApplicationController
  before_action :check_no_gifts, only: [:create]

  def create
    to_user = User.find_by(id: params[:to_user_id])

    error_message = current_user.error_message to_user

    return redirect_to home_index_path, flash: {
      notice: error_message
    } if error_message.present?

    current_user.gifts.first.update(to_user: to_user)

    to_user.fortunes.create(
      from_user: current_user,
      message: fortune_params[:message]
    ) if current_user.gifts.first.destroy

    redirect_to home_index_path, flash: {
      notice: "#{to_user.name || to_user.email}に感謝を送れました"
    }
  end

  private

  def fortune_params
    params.require(:fortune).permit(:message)
  end

  def check_no_gifts
    return redirect_to home_index_path,
      flash: {
        alert: '送れる感謝はないです。'
      } if current_user.gifts.empty?
  end
end
