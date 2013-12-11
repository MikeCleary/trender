require 'yaml'

Place.destroy_all
Trend.destroy_all

Country.get_countries(YAML.load_file('spec/support/locations/locations_YAML.yml'))

@place = Place.find_by(:country_code => "AU")
@trend = Trend.create!(
  :place_id => "45",
  :subject => "#WeLoveAustralia"
  )

@place.trends << @trend
@place.save