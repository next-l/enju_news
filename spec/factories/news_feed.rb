FactoryBot.define do
  factory :news_feed do |f|
    f.sequence(:title){|n| "news_feed_#{n}"}
    f.sequence(:url){|n| "http://www.example.com/feed/#{n}"}
    f.library_group_id '7dbdeb02-98ff-4158-881b-ce5339742780'
  end
end
