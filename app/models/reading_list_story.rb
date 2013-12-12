class ReadingListStory < ActiveRecord::Base
    belongs_to :story
    belongs_to :reading_list
end
