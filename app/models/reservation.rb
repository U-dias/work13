class Reservation < ApplicationRecord
  enum status: {Waiting: 0, Approved: 1}
  
  belongs_to :user
  belongs_to :room

  has_many :reviews

  validates message:"can not reserve"
  if: :date_in_future

  private
   def date_in_future
    end_date > start_date
   end


end
