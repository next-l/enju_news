class AddUrlToNewsPost < ActiveRecord::Migration
  def self.up
    add_column :news_posts, :url, :string
  end

  def self.down
    remove_column :news_posts, :url
  end
end
