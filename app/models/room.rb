class Room < ApplicationRecord
  belongs_to :user

  has_many_attached :photos
  has_many :reservations
  has_many :guest_reviews
  has_many :reviews

  validates :r_name, :r_self, :r_price, :r_create, :r_address, presence: true
  validates :r_price, numericality: {only_integer: true, greater_than_or_equal_to: 1}

  def average_rating
    guest_reviews.count == 0 ? 0 : guest_reviews.average(:stars).round(2).to_i
  end  
  
end
