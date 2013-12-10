require 'machinist/active_record'

Trend.blueprint(:Australian) do
  place_id { 3 }
  subject { Faker::Lorem.words(1) }
end

