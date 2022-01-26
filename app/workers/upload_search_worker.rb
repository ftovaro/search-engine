class UploadSearchWorker
  include Sidekiq::Worker
  require('stopwords')

  def perform(uuid, query)
    p "Uploading uuid: #{uuid} and query: #{query}"
    Search.create(user_uuid: uuid, query: query)

    filter = Stopwords::Snowball::Filter.new "en"
    keywords = filter.filter "#{query}".split
    keywords.each { |word| Keyword.create(word: word) }
    # Keyword.collection.aggregate([{'$group':{'_id': {'$toLower': '$word'},'count': { '$sum': 1 }}}, { '$sort': { 'count': -1}}, {'$limit': 2}]).to_a
  end
end
