require 'yaml'

Place.destroy_all
Trend.destroy_all

Country.get_countries(YAML.load_file('spec/support/locations/locations_YAML.yml'))

Trend.create!(
  
  )