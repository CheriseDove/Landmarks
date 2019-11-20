class AttractionsController < ApplicationController
  def index
    @landmarks = Landmark.order(:name)
  end
end
