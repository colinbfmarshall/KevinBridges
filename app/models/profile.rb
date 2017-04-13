class Profile < ApplicationRecord
  belongs_to :user
  delegate :category, to: :user
  has_many :posts, through: :user

  has_attached_file :profile_picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :profile_picture, content_type: /\Aimage\/.*\z/

  validates :profile_picture, :first_name, :last_name, :mobile, presence: true
  validates :username, presence: true, uniqueness: true

  validates :about, presence: true, length: { maximum: 500 }, :if => lambda { |profile| profile.user.category == "Stylist" }  
  validates :postcode, presence: true, :if => lambda { |profile| profile.user.category == "Stylist" }
  #validates :salon, :salon_website, presence: true, :if => lambda { |profile| profile.user.category == "Stylist" }

  geocoded_by :postcode
  after_validation :geocode
  after_validation :reverse_geocode

  scope :stylists, lambda { |category| joins(:user).where('users.category = ?', "Stylist") }

  def display_name
    [first_name, last_name].join(' ')
  end

  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.city = geo.city
    end
  end

  def total_likes
    posts.sum(&:cached_votes_total)
  end

end