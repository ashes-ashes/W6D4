# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  favorite   :boolean          default(FALSE)
#

class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true
  validates :title, uniqueness: { scope: :artist_id }

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: "User"

  has_many :shares, 
    foreign_key: :artwork_id, 
    class_name: "ArtworkShare"

  has_many :shared_viewers, 
    through: :shares, 
    source: :viewer

  has_many :comments,
    foreign_key: :artwork_id,
    class_name: "Comment",
    dependent: :destroy

  has_many :memberships,
    foreign_key: :artwork_id,
    class_name: "CollectionMembership",
    dependent: :destroy

  has_many :collections,
    through: :memberships,
    source: :collection

  has_many :likes, as: :likable
  
end
