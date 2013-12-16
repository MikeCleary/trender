require 'spec_helper'

  describe ReaderLibrary do
    context "associations" do 
      it { should belong_to(:reader) }
      it { should belong_to(:reading_list) }
    end
end
