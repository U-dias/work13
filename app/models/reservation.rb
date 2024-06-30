class Reservation < ApplicationRecord
  enum status: {Waiting: 0, Approved: 1}
  
  belongs_to :user
  belongs_to :room

  has_many :reviews

end
