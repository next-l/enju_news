class CreateNewsPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :news_posts do |t|
      t.text :title
      t.text :body
      t.references :user, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :required_role_id, default: 1, null: false
      t.text :note
      t.integer :position
      t.boolean :draft, default: false, null: false

      t.timestamps
    end
  end
end
