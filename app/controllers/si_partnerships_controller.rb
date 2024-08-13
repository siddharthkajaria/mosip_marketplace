class SiPartnershipsController < ApplicationController
  before_action :set_si_partnership, only: %i[ show edit update destroy ]

  # GET /si_partnerships or /si_partnerships.json
  def index
    @si_partnerships = SiPartnership.all
  end

  # GET /si_partnerships/1 or /si_partnerships/1.json
  def show
  end

  # GET /si_partnerships/new
  def new
    @si_partnership = SiPartnership.new
  end

  # GET /si_partnerships/1/edit
  def edit
  end

  # POST /si_partnerships or /si_partnerships.json
  def create
    @si_partnership = SiPartnership.new(si_partnership_params)

    respond_to do |format|
      if @si_partnership.save
        format.html { redirect_to si_partnership_url(@si_partnership), notice: "Si partnership was successfully created." }
        format.json { render :show, status: :created, location: @si_partnership }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @si_partnership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /si_partnerships/1 or /si_partnerships/1.json
  def update
    respond_to do |format|
      if @si_partnership.update(si_partnership_params)
        format.html { redirect_to si_partnership_url(@si_partnership), notice: "Si partnership was successfully updated." }
        format.json { render :show, status: :ok, location: @si_partnership }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @si_partnership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /si_partnerships/1 or /si_partnerships/1.json
  def destroy
    @si_partnership.destroy

    respond_to do |format|
      format.html { redirect_to si_partnerships_url, notice: "Si partnership was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_si_partnership
      @si_partnership = SiPartnership.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def si_partnership_params
      params.require(:si_partnership).permit(:name, :desc, :code, :status)
    end
end
