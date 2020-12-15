class AddFieldLongUrl < ActiveRecord::Migration[6.1]
  def change
    add_column :urls, :long_url, :string
    add_column :urls, :short_url, :string

    remove_column :urls, :url
  end
end
