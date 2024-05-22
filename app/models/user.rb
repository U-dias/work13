class User < ApplicationRecord
  has_many :rooms
  
  validates :full_name, :email, presence: true, length: {maximum: 50}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
