class LineLandmark < ApplicationRecord
  belongs_to :landmark
  belongs_to :list

  def total_price
    landmark.price * quantity
  end
end
