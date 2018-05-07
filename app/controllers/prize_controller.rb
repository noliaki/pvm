class PrizeController < ApplicationController
  before_action :authenticate_user!

  def index
    @prizes = Prize.all
  end
end
