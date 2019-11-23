class CombineItemsInList < ActiveRecord::Migration[6.0]
  # count the number of copies of each product in the cart
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
        end #end if
      end # end do
    end # end do
  end# end def up

  def down
  # split items with quantity>1 into multiple items
  LineLandmark.where("quantity>1").each do |item|

    # add individual items
    item.quantity.times do
      LineLandmark.create(list_id: item.list_id,
        landmark_id: item.landmark_id, quantity: 1)
    end # end do

    # remove original item
    item.destroy
  end # end do
end # end def down

end# end class
