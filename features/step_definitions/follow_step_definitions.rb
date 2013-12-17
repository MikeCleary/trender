Given(/^they view a list$/) do
  @reading_list = ReadingList.first
  @reading_list.title = "Followed list"
  visit reading_list_path(@reading_list)
end

Given(/^the click the "(.*?)" button$/) do |button|
  click_button(button)
end

Then(/^the button should change to "(.*?)"$/) do |button_text|
  page.has_content?('#follow', :text => button_text)
end

Then(/^they should see the list they followed$/) do
  page.has_content?('.reading_list', :text => "Followed list")
end
