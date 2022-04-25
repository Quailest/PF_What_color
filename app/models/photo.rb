class Photo < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :photo_tag_relations, dependent: :destroy
  has_many :tags, through: :photo_tag_relations, dependent: :destroy

  validates :title, presence: true
  validates :image, presence: true

  def get_image(size)
    image.variant(resize:[size]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

#部分一致で検索(タイトルと紹介文でヒット)
  def self.looks(search, word)
    @photo = Photo.where("title LIKE? OR introduction LIKE?","%#{word}%","%#{word}%")
  end

end
