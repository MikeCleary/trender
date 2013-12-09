require 'spec_helper'

describe TrendsController do

  describe "Obtaining trend locations" do
    before do
      get :locations
    end

    it "should return a twitter api bearer token" do
      expect(response.token_type).to eq(bearer_token)
    end

    it "should return available trend locations" do
      pending
    end
  end

end
