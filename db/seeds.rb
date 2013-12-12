require 'yaml'

Reader.destroy_all
Place.destroy_all
Trend.destroy_all
Story.destroy_all

Country.get_countries(YAML.load_file('spec/support/locations/locations_YAML.yml'))

@reader = Reader.create
@place = Place.find_by(:country_code => "AU")
@trend = Trend.create!(
  :place_id => @place.id,
  :subject => "#Australia"
  )

@place.trends << @trend
@place.save