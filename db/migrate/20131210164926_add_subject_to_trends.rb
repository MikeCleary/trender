class AddSubjectToTrends < ActiveRecord::Migration
  def change
    add_column :trends, :subject, :string
  end
end
