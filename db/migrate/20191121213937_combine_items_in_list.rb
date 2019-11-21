class CombineItemsInList < ActiveRecord::Migration[6.0]
  def up
    List.all.each do |list|
    # count the number of copies of each product in the list
    sums = list.line_landmarks.group(:landmark_id).sum(:quantity)
    sums.each do |landmark_id, quantity|
      if quantity > 1

        # remove individual items
        list.line_landmarks.where(landmark_id: landmark_id).delete_all

        # replace with single item and record quantity
        item = list.line_landmarks.build(landmark_id: landmark_id)
        item.quantity = quantity
        item.save!
      end
    end
    end
end
end
