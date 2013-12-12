When(/^the visitor clicks on a trend$/) do
  find('li', :text => "#Australia").click
end

Then(/^a list of stories for this trend appear$/) do
  assert 20, page.all('.story')
end

When(/^the visitor clicks the "(.*?)" button on a story$/) do |button|
  click_button('add')
end

Then(/^the story appears in the users reading list$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^that story appears$/) do
  pending # express the regexp above with the code you wish you had
end
