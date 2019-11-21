class AttractionsController < ApplicationController
  include CurrentList
  before_action :set_list
  def index
    @landmarks = Landmark.order(:name)
  end
end
