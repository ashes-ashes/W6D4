class AddIndexToCollectionMemberships < ActiveRecord::Migration[5.2]
  def change
    add_index :collection_memberships, [:artwork_id, :collection_id], unique: true
  end
end
