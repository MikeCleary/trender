class CreateReaderLibraries < ActiveRecord::Migration
  def change
    create_table :reader_libraries do |t|
      t.integer :reader_id
      t.integer :reading_list_id

      t.timestamps
    end
  end
end
