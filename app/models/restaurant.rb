class Restaurant < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :genre, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :visited_at, presence: true
  validate :image_size 

  def self.ransackable_attributes(auth_object = nil)
    %w[name genre rating comment visited_at]
  end


  private
 def image_size
   if image.attached? && image.blob.byte_size > 5.megabytes
      errors.add(:image, '5MB以下にしてください')
   end
  end
end