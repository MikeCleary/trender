require 'spec_helper'

describe TopicsController do
  context "adding a topic" do 
    before do 
      @trend = Trend.make!(:australian)
      @reading_list = ReadingList.create(
        :trend_id => @trend.id
        )
      
      @params = { 
        :topic => { :name => "Jam" },
        :reading_list_id => @reading_list.id,
        :format => "js"
      }

    end
    
    context "a new topic" do 
      before do  
        post :create, @params
        @topic = Topic.all.last
      end

      it "should create a new topic" do
        expect(Topic.count).to eq(1)
        expect(@topic.name).to eq("Jam")
      end

      it "should associate that topic with the reading list" do 
        expect(@topic.reading_lists.last).to eq(@reading_list)
      end
    end

    context "an existing topic" do 
      before do 
        @topic = Topic.make!(:Jam)
        post :create, @params
      end

      it "should not create a new topic" do 
        expect(Topic.count).to eq(1)
      end  

      it "should create a new topic association" do 
        expect(ReadingListTopic.count).to eq(1)
        @association = ReadingListTopic.all.last
        expect(@association.reading_list_id).to eq(@reading_list.id)
        expect(@association.topic_id).to eq(@topic.id)
      end
    end
  end
end
