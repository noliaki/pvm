class PrizeController < ApplicationController
  # before_action :authenticate_user!

  def index
    if !user_signed_in? && !admin_user_signed_in?
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

  private

  def prize_params
    params.require(:prize).permit(:name, :discription, :thumbnail)
  end
end
