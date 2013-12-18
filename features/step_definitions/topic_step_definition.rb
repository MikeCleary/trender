When(/^they give a list a topic$/) do
  fill_in 'topic[name]', :with => "Jam"
end

Then(/^the topic appears$/) do
  page.has_content?(:text => "Jam")
end
