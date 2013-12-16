class Comment < ActiveRecord::Base
  belongs_to :reading_list
  belongs_to :reader
  has_many :replies, :class_name => 'Comment', :foreign_key => :parent_id
  belongs_to :comment, :foreign_key => :parent_id

  validates :body, :presence => true
  validates :reader_id, :presence => true

  before_save do 
    if self.parent_id
      get_parent
    end
  end

  def get_parent
    self.in_reply_to = Comment.includes(:reader).find(self.parent_id).reader.name
  end
end
