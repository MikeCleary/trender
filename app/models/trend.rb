class Trend < ActiveRecord::Base
  belongs_to :place
  has_many :reading_lists
  has_many :stories, :order => ("published DESC, created_at DESC")

  def self.get_trends(place, reader)
    if !place.trends.blank? && place.trends.last.created_at > (Time.now - 10.minutes)
      Trend.where(:place_id => place.id).order(:created_at => :desc).limit(10).reverse
    else
      client = Twitter::REST::Client.new do |config| 
        config.consumer_key = Trender::Application.config.consumer_key
        config.consumer_secret = Trender::Application.config.consumer_secret
        config.access_token = reader.access_token
        config.access_token_secret = reader.access_token_secret 
      end
      parse_trends(client.trends(place.woeid), place)
    end
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
    Trend.where(:place_id => place.id).order(:created_at => :desc).limit(10).reverse
  end

  def querify
    self.subject.gsub! '#', '' 
    self.subject.gsub! ' ', '_' 
    if self.subject.index(/[a-z][A-Z]/)
      self.subject.insert(self.subject.index(/[a-z][A-Z]/)+1, '_')
      self.querify
    end
    self.subject
  end
end
