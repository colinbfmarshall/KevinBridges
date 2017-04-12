class PostTreatment < ActiveRecord::Base
  belongs_to :post
  belongs_to :treatment
end
