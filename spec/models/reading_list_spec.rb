require 'spec_helper'

describe ReadingList do
  context "associations" do
    it { should belong_to(:trend) }
    it { should belong_to(:reader) }
    it { should have_many(:reading_list_stories) }
    it { should have_many(:stories).through(:reading_list_stories) }
    it { should have_many(:following_readers).through(:reader_libraries) }
    it { should have_many(:reading_list_topics) }
    it { should have_many(:topics).through(:reading_list_topics)}
  end
end
