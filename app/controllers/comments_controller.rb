class CommentsController < ApplicationController

  before_filter do 
    unless session[:logged_in]
      flash[:notice] = "You must log in to comment"
      render :text => flash[:notice]
    end
  end  

  def create
    @comment = Comment.new(comment_params)
    @comment.reading_list_id = params[:reading_list_id]
    @comment.reader_id = session[:reader_id]
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

  private
  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end