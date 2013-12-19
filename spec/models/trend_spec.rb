require 'spec_helper'

describe Trend do
  context "associations" do 
    it { should belong_to(:place) }
    it { should have_many(:stories) }
    it { should have_many(:reading_lists) }
  end

  context "getting trends" do 
    before do 
      @place = Place.make!(:australia)
      trends_json = JSON.parse(File.open('spec/support/trends/trends_australia.json').read).first
      trends_json.symbolize_keys!
      trends_json[:trends].each do |hash|
        hash.deep_symbolize_keys!
      end
      # Twitter::TrendResults.stubs(:from_response).returns(twitter_response)
      twitter_response = Twitter::TrendResults.new(trends_json)
      Trend.parse_trends(twitter_response, @place)
      @trend = Trend.first
    end

    it "should parse twitter trend objects to database" do 
      expect(Trend.all.count).to eq(10) 
      expect(@trend.subject).to eq('#BethanyMotaGiveaway')
    end
  end

  context "querify" do 
    before do 
      @trend_one = Trend.create( :subject => "#WeLoveTheNSA" )
      @trend_two = Trend.create( :subject => "#The Ashes" )
      @trend_one.querify
      @trend_two.querify
    end

    it "should make the subjects query friendly" do 
      expect(@trend_one.subject).to eq("We_Love_The_NSA")
      expect(@trend_two.subject).to eq("The_Ashes")
    end
  end
end
