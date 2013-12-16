class Reader < ActiveRecord::Base
  has_many :reading_lists
  has_many :comments
end
