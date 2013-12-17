require 'spec_helper'

describe ReadingListsController do
  
  before do     
    @reader = Reader.make!(:vanilla)
    @reading_list = ReadingList.make!(:vanilla)
    @story = Story.make!(:vanilla)
    @trend = Trend.make!(:vanilla)
    @story.trend_id = @trend.id
    @story.save
  end

  describe "add_story" do
    before do 
      params = { 
        :id => @story.id,
        :reading_list_id => @reading_list.id,
        :format => "js"
        }
      get 'add_story', params
    end 

    it "links a story with a reading_list" do
      @reading_list_story = ReadingListStory.last
      expect(@reading_list_story.story_id).to eq(@story.id)
      expect(@reading_list_story.reading_list_id).to eq(@reading_list.id)
    end
  end

  describe "saving a reading list" do
    
    context "invalid data" do 
      before do 
        params = {
          :id => @reading_list.id,
          :reading_list => {:title => @reading_list.title }
        }
        session[:reader_id] = @reader.id
        put :update, params 
      end

      it "not save a list with no stories" do
        expect(@reading_list.reader_id).to eq(nil)
        expect(flash[:notice]).to eq("Cannot save list with no stories")
      end
    end

    context "valid data" do
      before do 
        @reading_list.stories << @story        
        params = {
          :id => @reading_list.id,
          :reading_list => {:title => @reading_list.title }
        }
        session[:reader_id] = @reader.id
        put :update, params
      end

      it "should save a readers id onto the reading list" do
        @reading_list.reload
        expect(@reading_list.reader_id).to eq(@reader.id)
        response.should redirect_to(@reading_list_path)
      end
    end
  end
end
