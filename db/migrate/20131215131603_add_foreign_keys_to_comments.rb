class AddForeignKeysToComments < ActiveRecord::Migration
  def change
    add_column :comments, :parent_id, :integer
    add_column :comments, :reader_id, :integer
    add_column :comments, :reading_list_id, :integer
  end
end
