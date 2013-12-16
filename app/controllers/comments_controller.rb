class CommentsController < ApplicationController

  before_filter do 
    unless session[:logged_in]
      flash[:notice] = "You must log in to comment"
      return false
    end
  end  

  def create
    @comment = Comment.new(comment_params)
    @comment.reading_list_id = params[:reading_list_id]
    @comment.reader_id = session[:reader_id]
    @reading_list = ReadingList.find(params[:reading_list_id])
    if @comment.save 
      if @comment.parent_id
        render 'reply'
      else
        render 'create'
      end
    else
      flash[:notice] = @comment.errors.full_messages[0]
    end
  end

  def index 
    @reader = Reader.includes(:comments => :replies).find(params[:reader_id])
    @comments = @reader.comments
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end
