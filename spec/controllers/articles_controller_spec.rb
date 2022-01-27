require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :controller do
  before(:each) do
    FactoryBot.create(:article)
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: { query: "good-car"}
      expect(response).to be_successful
    end

    it "returns at least one articles" do
      get :index, params: { query: "This-is-an-article"}
      articles = JSON.parse(response.body).dig("articles")
      expect(articles.count).to eq 1
    end
  end
end
