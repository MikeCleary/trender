require 'spec_helper'

describe Story do
  context "associations" do 
    it { should belong_to(:trend) }
  end

  context "parsing feedzilla resonse" do
    before do 
      @trend = Trend.create!
      feedzilla = JSON(File.read('spec/support/stories/feedzilla_australia_stories.json'))
      Story.parse_feedzilla(feedzilla, @trend.id)
      @story = Story.first
    end

    it "should create stories in the database" do
      expect(Story.count).to eq(20)
    end

    it "should pull the correct data from the json" do    
      expect(@story.title).to eq("GM to stop Holden production in Australia (CNN)")
      expect(@story.url).to eq("http://news.feedzilla.com/en_us/stories/346756766?q=australia&client_source=api&format=json")
      expect(@story.source).to eq("CNN")
    end

    it "should associate these stories with a trend" do
      expect(@story.trend_id).to eq(@trend.id)
    end

  end
end
