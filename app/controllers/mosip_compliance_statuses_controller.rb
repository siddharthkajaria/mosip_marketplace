class MosipComplianceStatusesController < ApplicationController
  before_action :set_mosip_compliance_status, only: %i[ show edit update destroy ]

  # GET /mosip_compliance_statuses or /mosip_compliance_statuses.json
  def index
    @mosip_compliance_statuses = MosipComplianceStatus.all
  end

  # GET /mosip_compliance_statuses/1 or /mosip_compliance_statuses/1.json
  def show
  end

  # GET /mosip_compliance_statuses/new
  def new
    @mosip_compliance_status = MosipComplianceStatus.new
  end

  # GET /mosip_compliance_statuses/1/edit
  def edit
  end

  # POST /mosip_compliance_statuses or /mosip_compliance_statuses.json
  def create
    @mosip_compliance_status = MosipComplianceStatus.new(mosip_compliance_status_params)

    respond_to do |format|
      if @mosip_compliance_status.save
        format.html { redirect_to mosip_compliance_status_url(@mosip_compliance_status), notice: "Mosip compliance status was successfully created." }
        format.json { render :show, status: :created, location: @mosip_compliance_status }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mosip_compliance_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mosip_compliance_statuses/1 or /mosip_compliance_statuses/1.json
  def update
    respond_to do |format|
      if @mosip_compliance_status.update(mosip_compliance_status_params)
        format.html { redirect_to mosip_compliance_status_url(@mosip_compliance_status), notice: "Mosip compliance status was successfully updated." }
        format.json { render :show, status: :ok, location: @mosip_compliance_status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mosip_compliance_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mosip_compliance_statuses/1 or /mosip_compliance_statuses/1.json
  def destroy
    @mosip_compliance_status.destroy

    respond_to do |format|
      format.html { redirect_to mosip_compliance_statuses_url, notice: "Mosip compliance status was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mosip_compliance_status
      @mosip_compliance_status = MosipComplianceStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mosip_compliance_status_params
      params.require(:mosip_compliance_status).permit(:name, :desc, :is_active)
    end
end
