FactoryGirl.define do
  factory :news_post do |f|
    f.sequence(:title){|n| "news_post_#{n}"}
    f.sequence(:body){|n| "news_post_#{n}"}
    f.user{FactoryGirl.create(:librarian)}
  end
end
