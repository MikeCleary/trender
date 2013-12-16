class ReadingList < ActiveRecord::Base
  include Paginationate

  belongs_to :reader
  belongs_to :trend
  has_many :comments
  has_many :reading_list_stories
  has_many :stories, :through => :reading_list_stories
  
end
