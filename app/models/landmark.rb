class Landmark < ApplicationRecord
  before_destroy :ensure_not_referenced_by_any_line_landmark
  validates :image_url, :name, :location, :description,  presence: true
  validates :name, uniqueness: true
  has_many :line_landmarks, dependent: :destroy
  validates :price, numericality: { greater_than_or_equal_to: 0.00 }
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  private

# ensure that there are no line items referencing this product
def ensure_not_referenced_by_any_line_landmark
  if line_landmarks.empty?
    return true
  else
    errors.add(:base, 'Line Landmarks present')
    return false
  end
end
end
