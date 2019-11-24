class AdminController < ApplicationController
  def index
    @total_book_nows = BookNow.count
  end
end
