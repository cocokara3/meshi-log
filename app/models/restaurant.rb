class Restaurant < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    %w[name genre rating comment visited_at]
  end
end