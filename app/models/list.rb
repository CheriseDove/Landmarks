class List < ApplicationRecord
  has_many :line_landmarks, dependent: :destroy

  def add_landmark(landmark)
  current_item = line_landmarks.find_by(landmark_id: landmark.id)
  if current_item
    current_item.quantity += 1
  else
    current_item = line_landmarks.build(landmark_id: landmark.id)
  end
  current_item
  end

def total_price
  line_landmarks.to_a.sum { |item| item.total_price }
end

end
