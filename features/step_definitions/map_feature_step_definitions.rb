Given(/^the visitor is on the map page$/) do
  @reader = Reader.make!(:vanilla)
  page.set_rack_session(:reader_id => @reader.id)
  visit root_path
end

Given(/^there are trends in the database$/) do
  place = Place.make!(:australia)
  @trend = Trend.make!(:australian)
  place.trends << @trend
  Trend.make!(:not_australian)
end

Given(/^there are stories in the database for that trend$/) do
  story = Story.make(:vanilla)
  story.trend_id = @trend.id
  story.save
end

When(/^the visitor clicks on a country$/) do
  find('path[data-code="AU"]').click
end

Then(/^trends are returned for that country$/) do
  page.has_content?('li', :text => "#Australia")
  page.has_no_content?('li', :text => "#NotAustralia")
end
