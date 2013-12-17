class ReadingListTopic < ActiveRecord::Base
  belongs_to :reading_list
  belongs_to :topic
end
