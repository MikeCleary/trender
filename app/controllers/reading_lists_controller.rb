class ReadingListsController < ApplicationController

  def show
    @reading_list = ReadingList.includes(:stories, :comments, :topics).find(params[:id])
    @topic = Topic.new
    @topics = @reading_list.topics
    @comments = @reading_list.comments
    @comment = Comment.new
    if ReaderLibrary.find_by(:reader_id => session[:reader_id], :reading_list_id => @reading_list.id )
      @following = true
    end
  end

  def update 
    @reading_list = ReadingList.find(params[:id])
    if !@reading_list.stories.blank?
      @reading_list.update_attributes(reading_list_params)
      @reading_list.reader_id = session[:reader_id]
      @reading_list.save
      redirect_to @reading_list
    else
      flash[:notice] = "Cannot save list with no stories"
      render :js => :list_side 
    end 
  end

  def index 
    @page_number = ReadingList.paginate(params)
    @reading_lists = ReadingList.all.includes(:stories).includes(:comments).limit(10).offset(10 * @page_number)
  end

  def destroy
    @reading_list = ReadingList.find(params[:id])
    @reading_list.destroy
    redirect_to root_path
  end

  #AJAX ROUTES
  def add_story
    @story = Story.includes(:trend).find(params[:id])
    @reading_list = ReadingList.find_or_create_by(
      :reader_id => session[:reader_id],
      :trend_id => @story.trend_id
    )
    ReadingListStory.create(
      :story_id => @story.id,
      :reading_list_id => @reading_list.id
    )
    @reading_list = ReadingList.includes(:stories).includes(:trend).find(@reading_list)
    render :list_side
  end

  def add_follow
    ReaderLibrary.create(
      :reading_list_id => params[:id],
      :reader_id => session[:reader_id]
    )
    render :nothing => true
  end

  def remove_follow
    follow = ReaderLibrary.where(
      :reading_list_id => params[:id],
      :reader_id => session[:reader_id]
    )[0]
    follow.destroy
    render :nothing => true
  end
  
  private
  def reading_list_params
    params.require(:reading_list).permit(:title)
  end
end
