class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id)
    @fortune = Fortune.new
    @has_fortunes = current_user.has_fortunes
  end

  def authentication
  end
end
