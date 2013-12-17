class StoriesController < ApplicationController

  def destroy
    binding.pry
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to :back
  end

end
