class CreateToLinks < ActiveRecord::Migration
  def change
    create_table :to_links do |t|
      t.string :url
      t.integer :frequency, default: 0
      t.integer :from_link_id

      t.timestamps
    end
  end
end
