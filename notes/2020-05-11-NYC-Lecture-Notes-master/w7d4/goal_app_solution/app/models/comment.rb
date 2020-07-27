class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :commentable, polymorphic: true
  # polymoprhic: true tells rails this is a polymorphic association
end
