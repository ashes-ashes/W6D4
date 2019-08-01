class AddDefaultValueToFavoriteInArtworks < ActiveRecord::Migration[5.2]
  def change
    change_column_default :artworks, :favorite, false
  end
end
