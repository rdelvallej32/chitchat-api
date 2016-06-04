#
class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :content
      t.string :category
      t.boolean :nyt_article, default: false

      t.timestamps null: false
    end
  end
end
