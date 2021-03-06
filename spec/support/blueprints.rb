require 'machinist/active_record'

##READERS
Reader.blueprint(:vanilla) do 
end

Reader.blueprint(:bruce) do
  name { "Bruce" }
end


##PLACE
Place.blueprint(:australia) do 
  country_code { "AU" }
  woeid { 23424748 }
end


##TRENDS
Trend.blueprint(:vanilla) do
end

Trend.blueprint(:australian) do
  subject { "#Australia" }
end

Trend.blueprint(:not_australian) do
  subject { "#NotAustralia" }
end

Trend.blueprint(:to_find) do 
  subject { "Title to be found" }
end


##STORIES
Story.blueprint(:vanilla) do 
  title { "A Story" }
  url { Faker::Internet.url }
end


##LISTS
ReadingList.blueprint(:vanilla) do 
end

ReadingList.blueprint(:to_not_find) do 
  title { Faker::Lorem.words.join(' ') }
end

ReadingList.blueprint(:followed) do 
  title { "Followed list" }
end


##COMMENTS
Comment.blueprint(:vanilla) do 
end

Comment.blueprint(:inappropriate) do 
  body { Faker::Internet.url }
end

##TOPICS
Topic.blueprint(:Jam) do 
  name { "Jam" }
end

##MODERATOR

Moderator.blueprint(:vanilla) do 
  email { Faker::Internet.email }
  password { "password" }
end