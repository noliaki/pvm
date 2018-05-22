class Manage::ApplicationController < ActionController::Base
  before_action :authenticate_admin_user!
  protect_from_forgery with: :exception
  layout "manage/application"
end
