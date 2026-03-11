class Restaurant < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  has_many :restaurant_tags, dependent: :destroy
  has_many :tags, through: :restaurant_tags

  validates :name, presence: true
  validates :genre, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :visited_at, presence: true
  validate :image_size

  def tag_names
    tags.map(&:name).join(' ')
  end

  def tag_names=(names)
    self.tags = names.split(' ').map(&:strip).uniq.map do |name|
      Tag.find_or_create_by!(name: name)
    end
  end

  def self.ransackable_attributes(auth_object = nil)
   %w[name genre rating comment visited_at]
 end

 def self.ransackable_associations(auth_object = nil)
   %w[tags]
 end

  private

  def image_size
    if image.attached? && image.blob.byte_size > 5.megabytes
      errors.add(:image, '5MB以下にしてください')
    end
  end
end