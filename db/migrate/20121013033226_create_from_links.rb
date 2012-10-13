class CreateFromLinks < ActiveRecord::Migration
  def change
    create_table :from_links do |t|
      t.string :url

      t.timestamps
    end
  end
end
