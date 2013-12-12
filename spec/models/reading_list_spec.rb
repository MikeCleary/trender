require 'spec_helper'

describe ReadingList do
  context "associations" do
    it { should belong_to(:trend) }
    it { should belong_to(:reader) }
    it { should have_many(:reading_list_stories) }
    it { should have_many(:stories).through(:reading_list_stories) }
  end
end
