class BookNow < ApplicationRecord
  has_many :line_landmarks, dependent: :destroy
  validates :name, :email, presence: true

  def add_line_landmarks_from_list(list)
  list.line_landmarks.each do |item|
    item.list_id = nil
    line_landmarks << item
  end
end
end
