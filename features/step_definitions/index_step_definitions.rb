
Given(/^there are (\d+) reading lists in the database$/) do |number_of_lists|
  15.times do 
    @trend = Trend.make!(:australian)
    @reader = Reader.make!(:vanilla)
    @reading_list = ReadingList.create(
      :trend_id => @trend.id,
      :reader_id => @reader.id
    )
  end
end

Given(/^the member navigates to "(.*?)"$/) do |link|
  click_link(link)
end

Then(/^they should see (\d+) "(.*?)"$/) do |number, css|
  assert number, page.all(:css, css).count
end

Then(/^when they navigate to the next page$/) do
  click_link('Next')
end

Given(/^there are (\d+) readers in the database$/) do |arg1|
  15.times { Reader.make!(:vanilla) }
end



