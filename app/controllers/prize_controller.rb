class PrizeController < ApplicationController
  # before_action :authenticate_user!

  def index
    if !authenticated?
      redirect_to root_path, flash: {
        notice: "だめ！！"
      }
    end
    @prizes = Prize.all
  end

  def new
    if !admin_user_signed_in?
      redirect_to root_path, flash: {
        notice: "だめ！！"
      }
    end
    @prize = Prize.new
  end

  def create
    @prize = Prize.new(prize_params)

    if @prize.save
      redirect_to prize_index_path, flash: {
        notice: "追加OK！"
      }
    else

    end
  end

  def exchange
    @prize = Prize.find_by_id(params['prize_id'])
  end

  def create_exchange
    prize = Prize.find_by_id(params['prize_id'])
    purchase_prize = current_user.prize_users.new(prize_id: prize.id)
    purchase_prize.save
    current_user.fortunes.limit(prize.price).destroy_all

    redirect_to prize_index_path, flash: {
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

  def authenticated?
    user_signed_in? || admin_user_signed_in?
  end
end
