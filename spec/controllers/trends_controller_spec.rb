require 'spec_helper'

describe TrendsController do

  describe "Obtaining trend locations" do
    before do
      get :locations
    end

    it "should return a twitter api bearer token" do
      pending
    end

    it "should return available trend locations" do
      pending
    end
  end

end
