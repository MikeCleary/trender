require 'spec_helper'

describe Topic do
  context "associations" do 
    it { should have_many(:reading_list_topics) }
    it { should have_many(:reading_lists).through(:reading_list_topics) }
  end
end
