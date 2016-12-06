class Post < ApplicationRecord
  acts_as_taggable
  acts_as_votable

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  validates :picture, attachment_presence: true
  validates :treatment, presence: true
  validates :price, presence: true
  validates :length, presence: true

  belongs_to :user
  has_many :comments

  after_commit :add_tags

  def add_tags
    if self.tag_list.to_a.exclude?(self.length)
      self.tag_list << self.length  
      self.save!
    end
  end

end
