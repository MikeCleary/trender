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

  def reading_lists
    @topics = Topic.all
    @page_number = ReadingList.paginate(params)
    @topic = Topic.includes(:reading_lists => :comments, :reading_lists => :stories).find(params[:id])
    @reading_lists = @topic.reading_lists.limit(10).offset(10 * @page_number)
    render 'reading_lists/index'
  end

  private
  def topic_params
    params.require(:topic).permit(:name, :reading_list_id)
  end
end
