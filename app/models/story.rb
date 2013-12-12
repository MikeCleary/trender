class Story < ActiveRecord::Base
  belongs_to :trend

  def self.get_feedzilla(params, trend)
    trend.subject.gsub!('#', '')
    url = "http://api.feedzilla.com/v1/articles/search.json?q=#{trend.subject}&order=date&count=10"
    feedzilla_response = HTTParty.get(url)
    parse_feedzilla(feedzilla_response, params[:id])
  end

  def self.parse_feedzilla(trend_id)  
    json['articles'].each do |article|
      ActiveRecord::Base.transaction do
        Story.create!(
          :title => article['title'],
          :url => article['url'],
          :source => article['source'],
          :published => article['publish_date'],
          :trend_id => trend_id
        )
      end
    end
    Story.where(:trend_id => params[:id])
  end

  def self.get_stories(params)
    trend = Trend.includes(:stories).find(params[:id])
    binding.pry
    if !trend.stories.blank? && trend.stories.last.created_at < (Time.now - 10.minutes)
      trend.stories
    else
      binding.pry
      get_feedzilla(params, trend)
    end
  end
end