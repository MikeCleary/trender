class ReaderLibrary < ActiveRecord::Base
  belongs_to :reader 
  belongs_to :reading_list
end
