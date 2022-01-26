module Api
  module V1
    class StatisticsController < Api::BaseController
      def index
        keywords = Keyword.collection.aggregate([{'$group':{'_id': {'$toLower': '$word'},'count': { '$sum': 1 }}}, { '$sort': { 'count': -1}}, {'$limit': 2}]).to_a
        last_searches = Search.collection.find().sort({_id: -1}).limit(5).to_a.pluck(:query)
        render json: { keywords: keywords, last_searches: last_searches }, status: 200
      end
    end
  end
end