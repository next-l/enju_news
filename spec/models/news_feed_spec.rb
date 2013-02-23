# -*- encoding: utf-8 -*-
require 'spec_helper'

describe NewsFeed do
  fixtures :news_feeds
  VCR.use_cassette :record => :new_episodes do

    it "should expire cache" do
      news_feeds(:news_feed_00001).expire_cache.should be_true
    end

    it "should expire fragment cache" do
      news_feeds(:news_feed_00001).expire_fragment_cache.should be_true
    end

    it "should get content" do
      news_feeds(:news_feed_00001).content.should be_true
    end

    it "should not get content if the feed is invalid" do
      news_feeds(:news_feed_00002).content.should be_nil
    end

    it "should reload content" do
      news_feeds(:news_feed_00001).force_reload.should be_true
    end

    it "should fetch feeds" do
      NewsFeed.fetch_feeds.should be_true
    end
  end
end

# == Schema Information
#
# Table name: news_feeds
#
#  id               :integer          not null, primary key
#  library_group_id :integer          default(1), not null
#  title            :string(255)
#  url              :string(255)
#  body             :text
#  position         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

