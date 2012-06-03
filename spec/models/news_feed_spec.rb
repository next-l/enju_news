# -*- encoding: utf-8 -*-
require 'spec_helper'

describe NewsFeed do
  fixtures :news_feeds
  use_vcr_cassette :record => :new_episodes

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
