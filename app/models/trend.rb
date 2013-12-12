class Trend < ActiveRecord::Base
  belongs_to :place
  has_many :stories, :order => ("created_at DESC")
end
