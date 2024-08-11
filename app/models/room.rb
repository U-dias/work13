class Room < ApplicationRecord
  belongs_to :user


  has_one_attached :photos
  has_many :reservations
  has_many :guest_reviews
  has_many :reviews

  validates :r_name, :r_self, :r_price, :r_create, :r_address, presence: true, allow_blank: true
  validates :r_price, numericality: {only_integer: true, greater_than_or_equal_to: 1}

  def average_rating
    guest_reviews.count == 0 ? 0 : guest_reviews.average(:stars).round(2).to_i
  end

  def self.looks(search,keyword)
    if serach == "pefect_match"
      @room = Room.where("r_name LIKE?","#{keyword}")
    elsif search == "forward_match"
      @room = Room.where("r_name LIKE?","#{keyword}")
    elsif search == "backworkd_match"
      @room = Room.where("r_name LIKE?","#{keyword}")
    elsif search == "partial_match"
      @room = Room.where("r_name LIKE?","#{keyword}")
    else
      @room = Room.all
    end
  end

end
