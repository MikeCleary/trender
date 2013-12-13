class Story < ActiveRecord::Base
  belongs_to :trend
  has_many :reading_list_stories
  has_many :reading_lists, :through => :reading_list_stories

  def self.get_stories(params)
    trend = Trend.includes(:stories).find(params[:id])
    if !trend.stories.blank? && trend.stories.last.created_at < (Time.now - 10.minutes)
      trend.stories.limit(10)
    else
      get_feedzilla(trend)
    end
  end

  def self.get_feedzilla(trend)
    trend.subject.gsub!('#', '')
    url = "http://api.feedzilla.com/v1/articles/search.json?q=#{trend.subject}&order=relevance&count=10"
    feedzilla_response = HTTParty.get(url)
    parse_feedzilla(feedzilla_response, trend.id)
  end

  def self.parse_feedzilla(json, trend_id)  
    json['articles'].each do |article|
      ActiveRecord::Base.transaction do
        Story.find_or_create_by(
          :title => article['title'],
          :url => article['url'],
          :source => article['source'],
          :published => Date.parse(article['publish_date']),
          :trend_id => trend_id
        )
      end
    end
    Story.where(:trend_id => trend_id).order(:published => :desc, :created_at => :desc).limit(10)
  end
end