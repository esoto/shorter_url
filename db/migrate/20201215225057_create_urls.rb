class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.string :title
      t.string :url
      t.integer :visits

      t.timestamps
    end
  end
end
