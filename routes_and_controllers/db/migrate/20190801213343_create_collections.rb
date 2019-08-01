class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.string :title, null: false
      t.string :description
      t.index :title
      t.timestamps
    end
  end
end
