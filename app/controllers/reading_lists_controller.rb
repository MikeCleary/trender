class ReadingListsController < ApplicationController
  
  def add_story
    ReadingListStory.create(
      :story_id => params[:story_id],
      :reading_list_id => params[:reading_list_id]
      )
    @reading_list = ReadingList.includes(:stories).includes(:trend).find(params[:reading_list_id])
    render :list_side
      #Render Reading list show to side bar.
  end

  def show
    @reading_list = ReadingList.includes(:stories, :comments).find(params[:id])
    @comments = @reading_list.comments
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
  
  private
  def reading_list_params
    params.require(:reading_list).permit(:title)
  end
end
