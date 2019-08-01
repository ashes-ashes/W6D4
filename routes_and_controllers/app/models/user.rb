# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks, 
    foreign_key: :artist_id, 
    class_name: "Artwork",
    dependent: :destroy
  
  has_many :shared_artworks,
    foreign_key: :viewer_id, 
    class_name: "ArtworkShare"

  has_many :artwork_shares,
    through: :artworks,
    source: :shares,
    dependent: :destroy
  
  has_many :comments, 
    foreign_key: :user_id, 
    class_name: 'Comment',
    dependent: :destroy
  
  has_many :likes,
    foreign_key: :liker_id,
    class_name: "Like",
    dependent: :destroy

  has_many :collections,
    foreign_key: :user_id,
    class_name: "Collection",
    dependent: :destroy


end
