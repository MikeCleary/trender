Given(/^There are distinct readinglists in the database$/) do
  20.times {ReadingList.make!(:to_not_find)}
  ReadingList.make!(:to_find)
end

Given(/^We have built the sphinx index for them$/) do
  ThinkingSphinx::Test.start_with_autostop
end

Given(/^the visitor is on a page$/) do
  visit root_path
end

When(/^they put "(.*?)" into the search field$/) do |search_term|
  fill_in 'search', :with => search_term
end

Then(/^they should see the reading list "(.*?)"$/) do |searched_for|
  page.find('.reading_list', :text => searched_for)
end

Then(/^they should see a message telling them nothing was found$/) do
  page.has_content?(:text => "Your search returned no results")
end


