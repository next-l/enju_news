class AddNewsPostNumberTopPageToLibraryGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :library_groups, :news_post_number_top_page, :integer, default: 0, null: false
  end
end
