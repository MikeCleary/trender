class CreateReadingListTopics < ActiveRecord::Migration
  def change
    create_table :reading_list_topics do |t|
      t.integer :reading_list_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
