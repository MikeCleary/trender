require 'spec_helper'

describe Reader do
  describe "associations" do
    it { should have_many(:reading_lists) }
    it { should have_many(:followed_lists).through(:reader_libraries)}
  end
end
