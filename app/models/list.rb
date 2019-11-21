class List < ApplicationRecord
  has_many :line_landmarks, dependent: :destroy
end
