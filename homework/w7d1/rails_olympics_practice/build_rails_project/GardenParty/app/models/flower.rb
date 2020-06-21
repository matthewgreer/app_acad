class Flower < ApplicationRecord

  validates :flower_type, presence: true

  belongs_to :gardener,
  foreign_key: :gardener_id,
  class_name: :User
  
  belongs_to :garden,
  foreign_key: :garden_id,
  class_name: :Garden

end