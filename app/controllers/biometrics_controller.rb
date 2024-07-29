class BiometricsController < ApplicationController
  before_action :set_biometric, only: %i[ show edit update destroy ]

  # GET /biometrics or /biometrics.json
  def index
    @biometrics = Biometric.all
  end

  # GET /biometrics/1 or /biometrics/1.json
  def show
  end

  # GET /biometrics/new
  def new
    @biometric = Biometric.new
  end

  # GET /biometrics/1/edit
  def edit
  end

  # POST /biometrics or /biometrics.json
  def create
    @biometric = Biometric.new(biometric_params)

    respond_to do |format|
      if @biometric.save
        format.html { redirect_to biometric_url(@biometric), notice: "Biometric was successfully created." }
        format.json { render :show, status: :created, location: @biometric }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @biometric.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /biometrics/1 or /biometrics/1.json
  def update
    respond_to do |format|
      if @biometric.update(biometric_params)
        format.html { redirect_to biometric_url(@biometric), notice: "Biometric was successfully updated." }
        format.json { render :show, status: :ok, location: @biometric }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @biometric.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /biometrics/1 or /biometrics/1.json
  def destroy
    @biometric.destroy

    respond_to do |format|
      format.html { redirect_to biometrics_url, notice: "Biometric was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biometric
      @biometric = Biometric.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def biometric_params
      params.require(:biometric).permit(:name, :desc, :code)
    end
end
