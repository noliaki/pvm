class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id)
    @fortune = Fortune.new
    @fortunes_all = current_user.fortunes_all
  end
end
