class WaterReadingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_water_reading, only: [:show, :edit, :update, :destroy]

  # GET /water_readings
  # GET /water_readings.json
  def index
    @water_readings = WaterReading.all
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  # GET /water_readings/1
  # GET /water_readings/1.json
  def show
  end

  # GET /water_readings/new
  def new
    @water_reading = WaterReading.new
  end

  # GET /water_readings/1/edit
  def edit
  end

  # POST /water_readings
  # POST /water_readings.json
  def create
    @water_reading = WaterReading.new(water_reading_params)
      if @water_reading.save
        format.html { redirect_to @water_reading, notice: 'Water reading was successfully created.' }
        format.json { render :json => @water_reading, status: :created, location: @water_reading }
      else
        format.html { render :new }
        format.json { render json: @water_reading.errors, status: :unprocessable_entity }
      end
  end

  # PATCH/PUT /water_readings/1
  # PATCH/PUT /water_readings/1.json
  def update
    respond_to do |format|
      if @water_reading.update(water_reading_params)
        format.html { redirect_to @water_reading, notice: 'Water reading was successfully updated.' }
        format.json { render :show, status: :ok, location: @water_reading }
      else
        format.html { render :edit }
        format.json { render json: @water_reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /water_readings/1
  # DELETE /water_readings/1.json
  def destroy
    @water_reading.destroy
    respond_to do |format|
      format.html { redirect_to water_readings_url, notice: 'Water reading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_water_reading
      @water_reading = WaterReading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def water_reading_params
      params.require(:water_reading).permit(:node1, :node2, :node3, :node4, :node5, :node6, :node7, :node8 ,:garden_id)
    end
end
