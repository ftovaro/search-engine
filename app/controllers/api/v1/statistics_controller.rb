module Api
  module V1
    class StatisticsController < Api::BaseController
      def index
        keywords = Keyword.top_five_words
        last_searches = Search.last_queries
        devices = Search.devices
        render json: { keywords: keywords, last_searches: last_searches, devices: devices }, status: 200
      end

      def get_all_searches
        render json: { searches: Search.all.to_a }
      end
    end
  end
end