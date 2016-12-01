class Post < ApplicationRecord
  acts_as_taggable
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  validates :picture, attachment_presence: true
  validates :treatment, presence: true
  validates :price, presence: true

  belongs_to :user
end
