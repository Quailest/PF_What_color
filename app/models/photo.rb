class Photo < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  def get_image(size)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize:[size]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

#部分一致で検索
  def self.looks(search, word)
    @photo = Photo.where("title LIKE?","%#{word}%")
  end

end
