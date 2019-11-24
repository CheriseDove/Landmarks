class AttractionsController < ApplicationController
  skip_before_action :authorize
  include CurrentList
  before_action :set_list
  def index
    @landmarks = Landmark.order(:name)
  end
end
