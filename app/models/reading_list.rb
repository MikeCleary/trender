class ReadingList < ActiveRecord::Base
  include Paginationate

  belongs_to :reader
  belongs_to :trend

  has_many :comments

  has_many :reading_list_stories
  has_many :stories, :through => :reading_list_stories

  has_many :reader_libraries
  has_many :following_readers, :class_name => "Reader", :foreign_key => "reader_id", :through => :reader_libraries, :source => :reader 

  has_many :reading_list_topics
  has_many :topics, :through => :reading_list_topics
  
end
