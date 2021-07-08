class PrizesController < ApplicationController
  def index
    @prizes = Prize.all
  end

  def exchange
    @prize = Prize.find_by_id(params['prize_id'])
  end

  def create_exchange
    prize = Prize.find_by_id(params['prize_id'])
    purchase_prize = current_user.prize_users.new(prize_id: prize.id)
    purchase_prize.save!
    current_user.fortunes.limit(prize.price).destroy_all

    redirect_to prizes_path, flash: {
      notice: "交換OK！"
    }
  end

  private

  def prize_params
    params.require(:prize).permit(:name, :discription, :thumbnail)
  end

  def exchange_params
    params.require(:prize).permit(:id)
  end
end
