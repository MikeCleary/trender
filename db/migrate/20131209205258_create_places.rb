class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :country
      t.string :country_code
      t.integer :woeid

      t.timestamps
    end
  end
end
