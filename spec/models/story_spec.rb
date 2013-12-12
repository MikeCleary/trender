require 'spec_helper'

describe Story do
  context "associations" do 
    it { should belong_to(:trend) }
  end
  
  before do 
    @trend = Trend.create!(
      :subject => "#Cats"
      )
    @feedzilla = JSON(File.read('spec/support/stories/feedzilla_australia_stories.json'))
  end

  context "parsing feedzilla resonse" do
    before do 
      Story.parse_feedzilla(@feedzilla, @trend.id)
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

  context "getting new stories from feedzilla only if they're 10 minutes old" do

    before do 
      HTTParty.stubs(:get).returns(@feedzilla)
      params = { :id => @trend.id }
      2.times {Story.get_stories(params)}
      Timecop.travel(Time.now + 11.minutes) do
        Story.get_stories(params)
      end
    end

    it "create 40 stories not 60" do 
      expect(Story.count).to eq(40)
    end
  end
end
