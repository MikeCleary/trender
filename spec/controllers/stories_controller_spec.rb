require 'spec_helper'

describe StoriesController do
  context "destroy" do 
    before do 
      @story = Story.create
      params = { :id => @story.id }
      request.env["HTTP_REFERER"] = root_path
      delete :destroy, params 
    end

    it "should destroy story" do 
      expect(Story.all.count).to eq(0)
    end
  end

end
