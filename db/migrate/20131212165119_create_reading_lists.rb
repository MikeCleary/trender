class CreateReadingLists < ActiveRecord::Migration
  def change
    create_table :reading_lists do |t|
      t.integer :trend_id
      t.string :title

      t.timestamps
    end
  end
end
