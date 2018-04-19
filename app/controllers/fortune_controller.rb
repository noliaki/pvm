class FortuneController < ApplicationController
  def create
    return redirect_to home_index_path,
      flash: {
        alert: '送れる感謝はないです。'
      } if current_user.gifts.empty?

    to_user = User.find_by(id: params[:fortune][:user_id])

    return redirect_to home_index_path,
      flash: {
        alert: '送りたい人が存在しないようです。'
      } if to_user.nil?

    current_user.gifts.first.destroy
    to_user.fortunes.create(
      from_user: current_user,
      message: fortune_params[:message]
    )
  end

  private

  def fortune_params
    params.require(:fortune).permit(:message)
  end
end
