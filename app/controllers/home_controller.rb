class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = current_user.can_send_users
    @fortune = Fortune.new
    @fortunes_all = current_user.fortunes_all
  end
end
