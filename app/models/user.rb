class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_one :profile
  has_many :posts
  has_many :comments

  validates :category, presence: true

  delegate :username, to: :profile
end
