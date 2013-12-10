class TrendsController < ApplicationController

  def locations
    twitter_oauth_client ||= Twitter::REST::Client.new(
      :consumer_key => Trender::Application.config.consumer_key,
      :consumer_secret => Trender::Application.config.consumer_secret
    )
    @trend_locations = twitter_oauth_client.trends_available
    Country.get_countries(@trend_locations)
  end

  def map

  end

  private

  def twitter_oauth_client
  end
end
