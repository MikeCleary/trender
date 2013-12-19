require 'yaml'

ReadingList.destroy_all
Topic.destroy_all
Trend.destroy_all
Story.destroy_all
Reader.destroy_all

@moderator = Moderator.create(
  :email => "dave@dave.com",
  :password => "password"
  )

@trend = Trend.create(
  :subject => "#macPro"
  )

@reader1 = Reader.create(
  :name => "Jane",
  )

@reading_list_dave = ReadingList.create(
  :trend_id => @trend.id,
  :reader_id => @reader1.id,
  :description => "supercomputer or ashtray?"
  )

@reading_list_dave.topics << Topic.create(:name => "Apple")
@reading_list_dave.topics << Topic.create(:name => "iMac")

@story2 = Story.create(
  :title => "Apple starts taking orders for its all-new Mac Pro",
  :url => "http://ibnlive.in.com/news/apple-starts-taking-orders-for-its-allnew-mac-pro/440525-11.html",
  :source => "IBNLive",
  :published => "2013-12-19",
  :trend_id => @trend.id 
  )

@reading_list_dave.stories << @story2

@story3 = Story.create(
  :title => "Gallery: Apples new iMac Pro",
  :url => "http://www.zdnet.com/apples-new-mac-pro-7000016665/",
  :source => "ZDnet",
  :published => "2013-12-18",
  :trend_id => @trend.id 
  )

@reading_list_dave.stories << @story3
@reading_list_dave.save!

@trend2 = Trend.create(
  :subject => "#justBelieb"
  )

@reader2 = Reader.create(
  :name => "Bruce",
  )


@reading_list_bruce = ReadingList.create(
  :trend_id => @trend2.id,
  :reader_id => @reader2.id,
  :description => "I'm a Belieber!"
  )

@topic =Topic.create(:name => "Justin Bieber")
@reading_list_bruce.topics << @topic

@story1 = Story.create(
  :title => "Justin Bieber: Power 106 Radio Promo Before 'Believe' Premiere!",
  :url => "http://news.feedzilla.com/en_us/stories/348112354?count=10&q=premiere_believe&client_source=api&order=relevance&format=json&sb=1",
  :source => "Just Jared",
  :published => "2013-12-19",
  :trend_id => @trend2.id 
  )

@reading_list_bruce.stories << @story1

@story2 = Story.create(
  :title => "Graffiti Artist Alec Monopoly -- I Wanna Tag L.A. With Justin Bieber At 'Believe' Premiere",
  :url => "http://www.tmz.com/2013/12/18/graffiti-artist-alec-monopoly-justin-bieber-believe-premiere/#ixzz2nvrLAcsX",
  :source => "TMZ",
  :published => "2013-12-18",
  :trend_id => @trend2.id 
  )

@reading_list_bruce.stories << @story2
@reading_list_bruce.save!

@trend3 = Trend.create(
  :subject => ""
  )

@reading_list_dave = ReadingList.create(
  :trend_id => @trend.id,
  :reader_id => @reader1.id,
  )

@topic = Topic.create(:name => "The Ashes")
@reading_list_dave.topics << @topic
@topic = Topic.create(:name => "The shame")
@reading_list_dave.topics << @topic

@story2 = Story.create(
  :title => "Ashes 2013-14: Graeme Swann apologises after being condemned for making rape remark on Facebook",
  :url => "http://www.telegraph.co.uk/sport/cricket/international/theashes/10527141/Ashes-2013-14-Graeme-Swann-apologises-after-being-condemned-for-making-rape-remark-on-Facebook.html",
  :source => "The Telegraph",
  :published => "2013-12-19",
  :trend_id => @trend.id 
  )

@reading_list_dave.stories << @story2

@story3 = Story.create(
  :title => "Ashes 2013/14: Australia captain Michael Clarke praises Shane Watson",
  :url => "http://www1.skysports.com/cricket/news/12340/9079847/ashes-201314-australia-captain-michael-clarke-praises-shane-watson",
  :source => "ZDnet",
  :published => "2013-12-18",
  :trend_id => @trend.id 
  )

@reading_list_dave.stories << @story3
@reading_list_dave.save!
