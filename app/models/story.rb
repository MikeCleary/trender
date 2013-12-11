class Story < ActiveRecord::Base
  belongs_to :trend

  def self.parse_feedzilla(json, trend_id)
    
    json['articles'].each do |article|
      ActiveRecord::Base.transaction do
        Story.new(
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
