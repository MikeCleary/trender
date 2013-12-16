require 'spec_helper'

describe Comment do
  it { should belong_to(:reading_list) }
  it { should belong_to(:reader) }
  it { should have_many(:replies) }
  it { should belong_to(:comment) }
end
