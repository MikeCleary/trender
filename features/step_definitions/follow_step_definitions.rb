Given(/^they view a list$/) do
  within(page.all(:css, ".reading_list").first) do 
    click_link "View"
  end
end

Given(/^the click the "(.*?)" button$/) do |button|
  click_button(button)
end

Then(/^the button should change to "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^they should see the list they followed$/) do
  pending # express the regexp above with the code you wish you had
end
