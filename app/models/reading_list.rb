class ReadingList < ActiveRecord::Base
  belongs_to :reader
  has_many :trends
  has_many :reading_list_stories
  has_many :stories, :through => :reading_list_stories
end
