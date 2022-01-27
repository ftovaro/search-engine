require 'rails_helper'

RSpec.describe Article, type: :model do
  context "When testing the Article model" do
    it "The author property should return 'Felipe'" do
      article = Article.new(author: "Felipe")
      author = article.author
      expect(author).to eq "Felipe"
    end
  end
end
