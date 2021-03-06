class Post < ApplicationRecord
  include Filterable

  acts_as_taggable
  acts_as_votable

  belongs_to :user
  has_many :comments
  has_one :profile, through: :user
  delegate :username, to: :profile
  
  has_many :post_treatments, dependent: :destroy
  has_many :treatments, through: :post_treatments

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  validates :picture, attachment_presence: true
  
  validates :price, presence: true
  validates :length, presence: true
  validates :comments, length: { maximum: 140 }

  validates_presence_of :treatments

  after_commit :add_tags, :check_tags 

  scope :price, -> (price) { where price: price }
  scope :hair_length, -> (hair_length) {where length: hair_length }
  scope :treatment_filter, -> (treatment) { joins(:treatments).where("treatments.id" => treatment) }
  scope :location, lambda { |location| joins(:profile).where('profiles.city = ?', location) }

  def add_tags
    if self.tag_list.to_a.exclude?(self.length)
      self.tag_list << self.length  
      self.save!
    end
  end

  def check_tags
    self.tag_list.each do |word|
      if word.match(/\s/)
        self.tag_list.delete(word)
        self.tag_list << word.split
        self.save!
      end
    end
  end

  def self.most_votes
    order(cached_votes_total: :desc)
  end

  def self.newest
    order(created_at: :desc)
  end

end
