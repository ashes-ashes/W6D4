# == Schema Information
#
# Table name: collections
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Collection < ApplicationRecord
  validates :title, presence: true

  has_many :memberships,
    foreign_key: :collection_id,
    class_name: "CollectionMembership",
    dependent: :destroy

  has_many :members,
    through: :memberships,
    source: :artwork

  belongs_to :curator,
    foreign_key: :user_id,
    class_name: "User"


end
