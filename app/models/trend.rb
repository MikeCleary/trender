class Trend < ActiveRecord::Base
  belongs_to :place
  has_many :reading_lists, :through => :reading_list_trends
  has_many :stories, :order => ("created_at DESC")
end
