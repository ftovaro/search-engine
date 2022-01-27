class Keyword
  include Mongoid::Document
  include Mongoid::Timestamps
  field :word, type: String

  def self.top_five_words
    collection.aggregate([{'$group':{'_id': {'$toLower': '$word'},'count': { '$sum': 1 }}}, { '$sort': { 'count': -1}}, {'$limit': 5}]).to_a
  end
end
