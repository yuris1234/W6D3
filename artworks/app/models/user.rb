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
      primary_key: :id,
      foreign_key: :artist_id,
      class_name: :Artwork,
      dependent: :destroy

   has_many :artwork_shares,
      primary_key: :id,
      foreign_key: :viewer_id,
      class_name: :ArtworkShare,
      dependent: :destroy

   has_many :shared_artworks,
      through: :artwork_shares,
      source: :artwork

   has_many :comments,
      primary_key: :id,
      foreign_key: :author_id,
      class_name: :Comment,
      dependent: :destroy

   has_many :likes, foreign_key: :liker_id
end
