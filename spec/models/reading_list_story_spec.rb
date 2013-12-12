require 'spec_helper'

describe ReadingListStory do
  it { should belong_to(:story) }
  it { should belong_to(:reading_list)}
end
