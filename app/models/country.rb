class Country < Place

  def self.get_countries(places)
    places.each do |place|
      if place.place_type == "Country"
        Country.create(
          :country => place.country,
          :woeid => place.woeid,
          :country_code => place.country_code
        )
      end
    end
  end

  def self.write_series
    series = {}
    Country.all.each do |c|
      series = series.merge({c.country_code => 1})
    end
    File.open("app/assets/javascripts/countries.js", "w") do |f| 
      f.write( "var countries =" + "#{series.to_json}" + ';')
    end
  end

end