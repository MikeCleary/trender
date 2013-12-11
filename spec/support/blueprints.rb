require 'machinist/active_record'

Place.blueprint(:vanilla) do 
  country_code { "AU" }
end

Trend.blueprint(:vanilla) do
end

Trend.blueprint(:australian) do
  place_id { 3 }
  subject { "#Australia" }
end

Trend.blueprint(:not_australian) do
  place_id { 42 }
  subject { "#NotAustralian" }
end

