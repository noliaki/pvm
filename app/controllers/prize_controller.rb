class PrizeController < ApplicationController
  # before_action :authenticate_user!

  def index
    if !user_signed_in?
      redirect_to root_path, flash: {
        notice: "だめ！！"
      }
    end
    @prizes = Prize.all
  end

  def new
    @prize = Prize.new
  end

  def create
    @prize = Prize.new(prize_params)

    if @prize.save

    else

    end
  end

  private

  def prize_params
    params.require(:fortune).permit(:name, :discription, :thumbnail)
  end
end
