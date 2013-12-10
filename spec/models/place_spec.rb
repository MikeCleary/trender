require 'spec_helper'

describe Place do

  context "associations" do
    it { should have_many(:trends) }
  end

  context "getting places" do
    before do 
      @places = YAML.load_file('spec/support/locations/locations_YAML.yml')
      Country.get_countries(@places)
    end

    it "should create a database of locations" do
      expect(Place.all.length).to eq(42)

      @place = Place.first
      expect(@place).not_to eq(nil)
      expect(@place.country).to eq("United Arab Emirates")
      expect(@place.country_code).to eq("AE")
      expect(@place.woeid).to eq(23424738)
    end

  end
end
