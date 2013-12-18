Given(/^a moderator is logged in$/) do
  moderator = Moderator.make!(:vanilla)
  login_as(moderator,  :scope => :moderator)
end

Given(/^a moderator is viewing a list with comments$/) do
  @reading_list = ReadingList.make!(:vanilla)
  @reader = Reader.make!(:bruce)
  @comment = Comment.make(:inappropriate)
  @comment.reader_id = @reader.id
  @comment.save
  @reading_list.comments << @comment
  visit reading_list_path(@reading_list)
end

When(/^he deletes a comment$/) do
  click_link "remove comment"
end

Then(/^the comment is gone$/) do
  page.has_no_content?('.comment')  
end

When(/^he deletes a list$/) do
  click_button "Discard"
end

When(/^he views the list index$/) do
  visit reading_lists_path
end

Then(/^the list is gone$/) do
  page.has_no_content?(:css => '.reading_list')  
end
