class AddUrlToNewsPost < ActiveRecord::Migration[5.1]
  def self.up
    add_column :news_posts, :url, :string
  end

  def self.down
    remove_column :news_posts, :url
  end
end
