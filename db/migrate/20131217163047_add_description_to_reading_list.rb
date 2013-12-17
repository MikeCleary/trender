class AddDescriptionToReadingList < ActiveRecord::Migration
  def change
    add_column :reading_lists, :description, :text
  end
end
