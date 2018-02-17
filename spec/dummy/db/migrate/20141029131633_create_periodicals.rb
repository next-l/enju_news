class CreatePeriodicals < ActiveRecord::Migration[5.1]
  def change
    create_table :periodicals do |t|
      t.text :original_title
      t.string :periodical_type
      t.references :manifestation, index: true, foreign_key: true

      t.timestamps
    end
  end
end
