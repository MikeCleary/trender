class Story < ActiveRecord::Base
  belongs_to :trend

  def self.get_feedzilla(params)
    trend = Trend.includes(:stories).find(params[:id])
    if !trend.stories.blank? && trend.stories.last.created_at < (Time.now - 600)
      trend.stories
    else
      trend.subject.gsub!('#', '')
      url = "http://api.feedzilla.com/v1/articles/search.json?q=#{trend.subject}&order=date&count=10"
      feedzilla_response = HTTParty.get(url)
      parse_feedzilla(feedzilla_response, (params[:id].to_i))
      Story.where(:trend_id => params[:id])
    end
  end

  def self.parse_feedzilla(json, trend_id)
    json['articles'].each do |article|
      ActiveRecord::Base.transaction do
        Story.create(
          :title => article['title'],
          :url => article['url'],
          :source => article['source'],
          :published => article['publish_date'],
          :trend_id => trend_id.to_i
        )
      end
    end
  end
end
