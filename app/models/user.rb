class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :restaurants, dependent: :destroy
   has_many :favorites, dependent: :destroy
   has_many :favorite_restaurants, through: :favorites, source: :restaurant
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.guest = true
    end
  end
end