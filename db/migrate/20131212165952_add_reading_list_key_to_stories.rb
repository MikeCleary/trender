class AddReadingListKeyToStories < ActiveRecord::Migration
  def change
    add_column :stories, :reading_list_id, :integer
  end
end
