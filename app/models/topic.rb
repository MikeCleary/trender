class Topic < ActiveRecord::Base
  has_many :reading_list_topics
  has_many :reading_lists, :through => :reading_list_topics
end
