class ReadingListsController < ApplicationController
  
  def add_story
    ReadingListStory.create(
      :story_id => params[:story_id],
      :reading_list_id => params[:reading_list_id]
      )
    #Render Reading list show to side bar.
  end
  
end
