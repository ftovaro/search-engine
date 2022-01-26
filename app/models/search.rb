class Search
  include Mongoid::Document

  field :query, type: String
  field :user_uuid, type: String
end
