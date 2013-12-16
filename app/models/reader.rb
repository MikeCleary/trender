class Reader < ActiveRecord::Base
  include Paginationate

  has_many :reading_lists
  has_many :comments

end
