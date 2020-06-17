# == Schema Information
#
# Table name: users
#
#  id       :bigint           not null, primary key
#  username :string           not null
#
class User < ApplicationRecord
  validates :username, presence: true

  has_many :artworks,
  foreign_key: :artist_id,
  class_name: :Artwork

end
