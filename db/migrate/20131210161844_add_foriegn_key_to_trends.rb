class AddForiegnKeyToTrends < ActiveRecord::Migration
  def change
    add_column :trends, :place_id, :integer
  end
end
