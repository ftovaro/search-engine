class Keyword
  include Mongoid::Document
  include Mongoid::Timestamps
  field :word, type: String
end
