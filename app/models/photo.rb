class Photo < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit:[1000,1000]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @photo = Photo.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @photo = Photo.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @photo = Photo.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @photo = Photo.where("title LIKE?","%#{word}%")
    else
      @photo = Photo.all
    end
  end

end
