require 'spec_helper'

describe ReadingListTopic do
  it { should belong_to(:reading_list) }
  it { should belong_to(:topic) }
end
