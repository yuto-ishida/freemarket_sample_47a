class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true

  has_many :items, :dependent => :destroy
  has_many :credits, :dependent => :destroy
  has_many :contact_informations, :dependent => :destroy
  has_many :informations
  has_many :points, :dependent => :destroy
  has_many :evaluations
  has_many :likes
  has_many :messages
  has_many :buyers

end
