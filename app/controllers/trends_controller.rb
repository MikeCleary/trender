class TrendsController < ApplicationController

  def locations
    twitter_oauth_client ||= Twitter::REST::Client.new(
      :consumer_key => Trender::Application.config.consumer_key,
      :consumer_secret => Trender::Application.config.consumer_secret
    )
    @trend_locations = twitter_oauth_client.trends_available
    Country.get_countries(@trend_locations)
  end

  def show
    @trend = Trend.find(params[:id])
    @reading_list = ReadingList.create(
      :trend_id => @trend.id,
      :title => @trend.subject
      )
    @stories = Story.get_stories(params)
  end

  def trends_by_region
    @reader = Reader.first
    @place = Place.includes(:trends).find_by(:country_code => params[:country_code])
    @trends = Trend.get_trends(@place, @reader)
  end

end
