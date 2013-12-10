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

end