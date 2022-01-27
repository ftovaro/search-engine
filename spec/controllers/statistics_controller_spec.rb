require 'rails_helper'

RSpec.describe Api::V1::StatisticsController, type: :controller do
  before(:all) do
    @search = FactoryBot.create(:search)
    @search.query.split(" ").each { |word| FactoryBot.create(:keyword, {word: word}) }
  end

  after(:all) do
    Search.collection.drop
    Keyword.collection.drop
  end


  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end

    it "returns 'mobile' as device" do
      get :index, params: {}
      devices = JSON.parse(response.body).dig("devices")
      expect(devices.first.dig("_id")).to eq "mobile"
    end

    it "returns 5 words" do
      get :index, params: {}
      words = JSON.parse(response.body).dig("keywords")
      expect(words.count).to eq 5
    end

    it "returns last search" do
      get :index, params: {}
      last_searches = JSON.parse(response.body).dig("last_searches")
      expect(last_searches.first).to eq @search.query
    end
  end
end
