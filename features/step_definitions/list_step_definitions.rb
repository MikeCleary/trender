Given(/^A signed in visitor has choosen a trend from a list$/) do
  step "the visitor is on the map page"
  step "there are trends in the database"
  step "there are stories in the database for that trend"
  step "the visitor clicks on a country"
  step "trends are returned for that country"
  step "the visitor clicks on a trend"
  step "a list of stories for this trend appear"
  step "the visitor clicks the \"Add\" button on a story"
  step "the story appears in the users reading list"
end

When(/^a visitor clicks "(.*?)"$/) do |save_and_view|
  within('#side') do 
    click_button(save_and_view)
  end
end

Then(/^they a taken to their lists view$/) do
  @reading_list = ReadingList.find(@reader.reading_lists.last.id)
  current_path = reading_list_path(@reading_list)
end

Then(/^they see their new list$/) do
  page.find('h3', :text => @reading_list.title)
  page.find('li', :text => @reading_list.stories.first.title)
end

