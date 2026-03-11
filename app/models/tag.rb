class Tag < ApplicationRecord
  has_many :restaurant_tags, dependent: :destroy
  has_many :restaurants, through: :restaurant_tags

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end
end