require 'machinist/active_record'

Reader.blueprint(:vanilla) do
end

Place.blueprint(:australia) do 
  country_code { "AU" }
  woeid { 23424748 }
end

Trend.blueprint(:vanilla) do
end

Trend.blueprint(:australian) do
  subject { "#Australia" }
end

Trend.blueprint(:not_australian) do
  subject { "#NotAustralia" }
end

Story.blueprint(:vanilla) do 
  title { "A Story" }
  url { Faker::Internet.url }
end