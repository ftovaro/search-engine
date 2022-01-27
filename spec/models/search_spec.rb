require 'rails_helper'

RSpec.describe Search, type: :model do
  before(:all) do
    @search = FactoryBot.create(:search)
  end

  after(:all) do
    Search.collection.drop
  end

  context "When testing the Search model" do
    it "The query property should return 'Where to buy a car?'" do
      query = @search.query
      expect(query).to eq "Where to buy a car?"
    end

    it "The user_uuid property should return '123'" do
      user_uuid = @search.user_uuid
      expect(user_uuid).to eq "123"
    end

    it "The user_uuid property should return 'Mobile'" do
      device = @search.device
      expect(device).to eq "Mobile"
    end
  end
end
