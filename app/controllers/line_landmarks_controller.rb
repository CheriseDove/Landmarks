class LineLandmarksController < ApplicationController
  include CurrentList
  before_action :set_list, only: [:create]
  before_action :set_line_landmark, only: [:show, :edit, :update, :destroy]

  # GET /line_landmarks
  # GET /line_landmarks.json
  def index
    @line_landmarks = LineLandmark.all
  end

  # GET /line_landmarks/1
  # GET /line_landmarks/1.json
  def show
  end

  # GET /line_landmarks/new
  def new
    @line_landmark = LineLandmark.new
  end

  # GET /line_landmarks/1/edit
  def edit
  end

  # POST /line_landmarks
  # POST /line_landmarks.json
  def create
    landmark = Landmark.find(params[:landmark_id])
    #@line_landmark = @list.line_landmarks.build(landmark: landmark)
   @line_landmark = @list.add_landmark(landmark)

    respond_to do |format|
      if @line_landmark.save
        #format.html { redirect_to attractions_url}
        format.html {redirect_to @line_landmark.list}
        format.js { @current_item = @line_landmark }
        format.json { render :show, status: :created, location: @line_landmark.list }
      else
        format.html { render :new }
        format.json { render json: @line_landmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_landmarks/1
  # PATCH/PUT /line_landmarks/1.json
  def update
    respond_to do |format|
      if @line_landmark.update(line_landmark_params)
        format.html { redirect_to @line_landmark.list , notice: 'Line landmark was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_landmark }
      else
        format.html { render :edit }
        format.json { render json: @line_landmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_landmarks/1
  # DELETE /line_landmarks/1.json
  def destroy
    @line_landmark.destroy
    respond_to do |format|
      format.html { redirect_to line_landmarks_url, notice: 'Line landmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_landmark
      @line_landmark = LineLandmark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_landmark_params
      params.require(:line_landmark).permit(:landmark_id)
    end
end
