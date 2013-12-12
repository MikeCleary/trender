class ReadingList < ActiveRecord::Base
  has_many :trends
  has_many :reading_list_stories
  has_many :stories, :through => :reading_list_stories
end
