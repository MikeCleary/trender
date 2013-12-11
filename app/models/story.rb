class Story < ActiveRecord::Base
  belongs_to :trend

  def self.get_feedzilla(params)
      trend = Trend.find(params[:id])
      trend.subject.gsub!('#', '')
      url = "http://api.feedzilla.com/v1/articles/search.json?q=#{trend.subject}&order=date&count=10"
      feedzilla_response = HTTParty.get(url)
  end


  def self.parse_feedzilla(json, trend_id)
    
    json['articles'].each do |article|
      ActiveRecord::Base.transaction do
        Story.create(
          :title => article['title'],
          :url => article['url'],
          :source => article['source'],
          :published => article['publish_date'],
          :trend_id => trend_id
        )
      end
    end
  end

end
