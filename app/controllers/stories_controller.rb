class StoriesController < ApplicationController

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to :back
  end

end
