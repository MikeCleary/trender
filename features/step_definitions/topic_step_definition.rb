When(/^they give a list a topic$/) do
  fill_in 'topic[name]', :with => "Jam"
end

When(/^they click "(.*?)" link$/) do |link|
  find('a', :text => link).click
end

Then(/^the topic appears$/) do
  page.has_content?(:text => "Jam")
end

Then(/^they see the story with that topic$/) do
  page.has_content?('.reading_list', :text => "Jam")
end
