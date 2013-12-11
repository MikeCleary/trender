class AddFieldsToStories < ActiveRecord::Migration
  def change
    add_column :stories, :source, :string
    add_column :stories, :published, :string
  end
end
