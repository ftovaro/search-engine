class Search
  include Mongoid::Document

  field :query, type: String
  field :user_uuid, type: String
  field :device, type: String

  def self.last_queries
    collection.find().sort({_id: -1}).limit(5).to_a.pluck(:query)
  end

  def self.devices
    collection.aggregate([{'$group':{'_id': {'$toLower': '$device'},'count': { '$sum': 1 }}}, { '$sort': { 'count': -1}}, {'$limit': 2}]).to_a
  end
end
