class Article < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search,
                  against: %i[title description],
                  using: { tsearch: { dictionary: 'english' } }
end
