class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  scope :live, -> { where(live: true) }

end
