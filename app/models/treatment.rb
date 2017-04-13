class Treatment < ApplicationRecord
  has_many :posts, through: :post_treatments
  has_many :post_treatments

end
