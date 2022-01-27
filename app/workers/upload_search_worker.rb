class UploadSearchWorker
  include Sidekiq::Worker
  require('stopwords')

  def perform(uuid, query, device)
    p "Uploading uuid: #{uuid}, query: #{query}, device: #{device}"
    Search.create(user_uuid: uuid, query: query, device: device)

    filter = Stopwords::Snowball::Filter.new "en"
    keywords = filter.filter "#{query}".split
    keywords.each { |word| Keyword.create(word: word) }
  end
end
