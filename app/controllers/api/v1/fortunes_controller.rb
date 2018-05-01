require "#{Rails.root}/app/controllers/application_controller.rb"

module Api
  module V1
    class FortunesController < ApplicationController
      before_action :authenticate_user!
      skip_before_action :verify_authenticity_token

      def index
        render json: current_user
      end
    end
  end
end
