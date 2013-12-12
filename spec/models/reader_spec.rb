require 'spec_helper'

describe Reader do
  describe "associations" do
    it { should have_many(:reading_lists) }
  end
end
