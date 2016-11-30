class Profile < ApplicationRecord
  belongs_to :user

  has_attached_file :profile_picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :profile_picture, content_type: /\Aimage\/.*\z/

  validates :category, presence: true
  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mobile, presence: true
  validates :about, presence: true, length: { minimum: 120, maximum: 500 }
  validates :salon, presence: true
  validates :location, presence: true


  def display_name
      [first_name, last_name].join(' ')
  end
end