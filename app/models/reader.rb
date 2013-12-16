class Reader < ActiveRecord::Base
  has_many :reading_lists
  has_many :comments

  def self.paginate(params=nil)
    @page_number = params[:page_number].to_i if params[:page_number]
    @page_number ||= 0
  end
end
