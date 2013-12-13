class AddFieldsToReader < ActiveRecord::Migration
  def change
    add_column :readers, :name, :string
    add_column :readers, :access_token, :string
    add_column :readers, :access_token_secret, :string
  end
end
