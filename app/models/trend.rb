class Trend < ActiveRecord::Base
  belongs_to :place
  has_many :reading_lists
  has_many :stories, :order => ("published DESC, created_at DESC")

  def self.get_trends(place, reader)
    client = Twitter::REST::Client.new do |config| 
      config.consumer_key = Trender::Application.config.consumer_key
      config.consumer_secret = Trender::Application.config.consumer_secret
      config.access_token = reader.access_token
      config.access_token_secret = reader.access_token_secret 
    end
    trends = parse_trends(client.trends(place.woeid), place)
  end

  def self.parse_trends(trends, place)
    trends.each do |trend|
      ActiveRecord::Base.transaction do 
        Trend.find_or_create_by(
          :subject => trend.name,
          :place_id => place.id
        )
      end
    end
  end

end
