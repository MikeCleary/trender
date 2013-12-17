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

When(/^the put "(.*?)" into the seach field$/) do |search_term|
  fill_in 'Search', :with => search_term
end

When(/^click "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^they should see the reading list "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

