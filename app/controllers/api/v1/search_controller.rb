module Api
  module V1
    class SearchController < Api::BaseController
      def index
        p "searching"
        render json: { status: 200, message: "ok" }
      end
    end
  end
end