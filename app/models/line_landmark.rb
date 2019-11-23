class LineLandmark < ApplicationRecord
  belongs_to :landmark
  belongs_to :list, optional: true
  belongs_to :book_now, optional: true

  def total_price
    landmark.price * quantity
  end
end
