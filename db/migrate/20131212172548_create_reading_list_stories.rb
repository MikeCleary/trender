class CreateReadingListStories < ActiveRecord::Migration
  def change
    create_table :reading_list_stories do |t|
      t.integer :reading_list_id
      t.integer :story_id

      t.timestamps
    end
  end
end
