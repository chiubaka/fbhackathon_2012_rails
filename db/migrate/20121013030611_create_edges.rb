class CreateEdges < ActiveRecord::Migration
  def change
    create_table :edges do |t|
      t.string :from
      t.text :to

      t.timestamps
    end
  end
end
