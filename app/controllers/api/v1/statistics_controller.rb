module Api
  module V1
    class StatisticsController < Api::BaseController
      def index
        keywords = Keyword.collection.aggregate([{'$group':{'_id': {'$toLower': '$word'},'count': { '$sum': 1 }}}, { '$sort': { 'count': -1}}, {'$limit': 5}]).to_a
        last_searches = Search.collection.find().sort({_id: -1}).limit(5).to_a.pluck(:query)
        devices = Search.collection.aggregate([{'$group':{'_id': {'$toLower': '$device'},'count': { '$sum': 1 }}}, { '$sort': { 'count': -1}}, {'$limit': 2}]).to_a
        render json: { keywords: keywords, last_searches: last_searches, devices: devices }, status: 200
      end

      def get_all_searches
        render json: { searches: Search.all.to_a }
      end
    end
  end
end