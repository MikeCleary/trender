Given(/^they view a list$/) do
  within(page.all(:css, ".reading_list").first) do 
    click_link "View"
  end
end

Given(/^the click the "(.*?)" button$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^they should see the list they followed$/) do
  pending # express the regexp above with the code you wish you had
end
