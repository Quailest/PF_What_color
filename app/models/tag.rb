class Tag < ApplicationRecord
  has_many :photo_tag_relations, dependent: :destroy
  has_many :photos, through: :photo_tag_relations, dependent: :destroy
end
