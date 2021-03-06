class Reader < ActiveRecord::Base
  include Paginationate

  has_many :reading_lists
  has_many :comments
  has_many :reader_libraries
  has_many :followed_lists, :class_name => "ReadingList", :foreign_key => "reading_list_id", :through => :reader_libraries, :source => :reading_list

end
