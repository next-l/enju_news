class NewsFeed < ActiveRecord::Base
  attr_accessible :title, :url
  include ExpireEditableFragment
  default_scope :order => "news_feeds.position"
  belongs_to :library_group, :validate => true

  validates_presence_of :title, :url, :library_group
  validates_associated :library_group
  validates_length_of :url, :maximum => 255

  acts_as_list

  after_save :expire_cache
  after_destroy :expire_cache

  def self.per_page
    10
  end

  def expire_cache
    expire_fragment_cache
    Rails.cache.delete('news_feed_all')
    true
  end

  def expire_fragment_cache
    Role.all.each do |role|
      Rails.cache.delete("views/news_feed_content_#{id}_#{role.name}")
      logger.info "#{Time.zone.now} feed reloaded! : #{url}"
    end
  end

  def content(clear_cache = false)
    #page_url = URI.parse(url.rewrite_my_url)
    #if page_url.port == 80
    #  if Feedbag.feed?(url)
    #    feed_url = url
    #  else
    #    feed_url = Feedbag.find(url).first
    #  end
    #else
      # auto-discovery 非対応
      feed_url = url
    #end
    begin
      if clear_cache or body.blank?
        feed = open(feed_url) do |f|
          f.read
        end
        if rss = RSS::Parser.parse(feed, false)
          self.body = feed
          save!
        end
      end
    rescue StandardError, Timeout::Error
      nil
    end
    # tDiary の RSS をパースした際に to_s が空になる
    # rss = RSS::Parser.parse(feed)
    # rss.to_s
    # => ""
    #if rss.nil?
      begin
        rss = RSS::Parser.parse(body)
      rescue RSS::InvalidRSSError
        rss = RSS::Parser.parse(body, false)
      rescue RSS::NotWellFormedError, TypeError
        nil
      end
    #end
  end

  def force_reload
    expire_cache
    content(true)
  end

  def self.fetch_feeds
    NewsFeed.all.each do |news_feed|
      news_feed.force_reload
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

