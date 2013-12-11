require 'spec_helper'

describe Trend do
  context "associations" do 
    it { should belong_to(:place) }
    it { should have_many(:stories) }
  end
end
