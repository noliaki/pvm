class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.where.not(id: current_user.id)
    @gift = current_user.gifts[0]
  end

  def authentication
  end
end
