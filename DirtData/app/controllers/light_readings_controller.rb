class LightReadingsController < ApplicationController
  before_action :set_light_reading, only: [:show, :edit, :update, :destroy]

  # GET /light_readings
  # GET /light_readings.json
  def index
    @light_readings = LightReading.all
  end

  # GET /light_readings/1
  # GET /light_readings/1.json
  def show
  end

  # GET /light_readings/new
  def new
    @light_reading = LightReading.new
  end

  # GET /light_readings/1/edit
  def edit
  end

  # POST /light_readings
  # POST /light_readings.json
  def create
    @light_reading = LightReading.new(light_reading_params)

    respond_to do |format|
      if @light_reading.save
        format.html { redirect_to @light_reading, notice: 'Light reading was successfully created.' }
        format.json { render :show, status: :created, location: @light_reading }
      else
        format.html { render :new }
        format.json { render json: @light_reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /light_readings/1
  # PATCH/PUT /light_readings/1.json
  def update
    respond_to do |format|
      if @light_reading.update(light_reading_params)
        format.html { redirect_to @light_reading, notice: 'Light reading was successfully updated.' }
        format.json { render :show, status: :ok, location: @light_reading }
      else
        format.html { render :edit }
        format.json { render json: @light_reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /light_readings/1
  # DELETE /light_readings/1.json
  def destroy
    @light_reading.destroy
    respond_to do |format|
      format.html { redirect_to light_readings_url, notice: 'Light reading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_light_reading
      @light_reading = LightReading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def light_reading_params
      params.require(:light_reading).permit(:node1, :node2, :node3, :node4, :node5, :node6, :node7, :node8, :temp, :garden_id)
    end
end
