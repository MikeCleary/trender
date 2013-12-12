class AddReaderIdToReadingList < ActiveRecord::Migration
  def change
    add_column :reading_lists, :reader_id, :integer
  end
end
