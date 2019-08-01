class CreateCollectionMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_memberships do |t|
      t.integer :artwork_id, null: false
      t.integer :collection_id, null: false
      t.index :artwork_id
      t.index :collection_id
      t.timestamps
    end
  end
end
