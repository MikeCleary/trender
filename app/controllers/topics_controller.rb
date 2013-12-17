class TopicsController < ApplicationController

  def create
    unless @topic = Topic.find_by(:name => params[:topic][:name])
      @topic = Topic.create(topic_params)
    end
    ReadingListTopic.create(
      :reading_list_id  => params[:reading_list_id],
      :topic_id => @topic.id
    )
    @topic
  end

  def index
    binding.pry
  end

  private
  def topic_params
    params.require(:topic).permit(:name, :reading_list_id)
  end
end
