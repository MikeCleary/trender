require 'spec_helper'

describe ReadingListsController do

  describe "GET 'add_story'" do
    it "returns http success" do
      get 'add_story'
      response.should be_success
    end
  end

end
