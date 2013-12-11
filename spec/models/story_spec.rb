require 'spec_helper'

describe Story do
  context "associations" do 
    it { should belong_to(:trend) }
  end
end
