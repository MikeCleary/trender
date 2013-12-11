Given(/^the visitor is on the map page$/) do
  visit trends_map_path
end

Given(/^there are trends in the database$/) do
  @place = Place.make!(:australia)
  trend = Trend.make!(:australian)
  @place.trends << trend
  5.times {Trend.make!(:not_australian)}
end

When(/^the visitor clicks on a country$/) do
  find('path[data-code="AU"]').click
end

Then(/^trends are returned for that country$/) do
  page.has_content?('li', :text => "#Australia")
  page.has_no_content?('li', :text => "#NotAustralia")
end
