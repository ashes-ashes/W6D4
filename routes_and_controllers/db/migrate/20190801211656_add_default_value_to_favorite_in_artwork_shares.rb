class AddDefaultValueToFavoriteInArtworkShares < ActiveRecord::Migration[5.2]
  def change
    change_column_default :artwork_shares, :favorite, false
  end
end
