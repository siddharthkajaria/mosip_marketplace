class ProductFtmCertificationsController < ApplicationController
  before_action :set_product_ftm_certification, only: %i[ show edit update destroy ]

  # GET /product_ftm_certifications or /product_ftm_certifications.json
  def index
    @product_ftm_certifications = ProductFtmCertification.all
  end

  # GET /product_ftm_certifications/1 or /product_ftm_certifications/1.json
  def show
  end

  # GET /product_ftm_certifications/new
  def new
    @product_ftm_certification = ProductFtmCertification.new
  end

  # GET /product_ftm_certifications/1/edit
  def edit
  end

  # POST /product_ftm_certifications or /product_ftm_certifications.json
  def create
    @product_ftm_certification = ProductFtmCertification.new(product_ftm_certification_params)

    respond_to do |format|
      if @product_ftm_certification.save
        format.html { redirect_to product_ftm_certification_url(@product_ftm_certification), notice: "Product ftm certification was successfully created." }
        format.json { render :show, status: :created, location: @product_ftm_certification }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_ftm_certification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_ftm_certifications/1 or /product_ftm_certifications/1.json
  def update
    respond_to do |format|
      if @product_ftm_certification.update(product_ftm_certification_params)
        format.html { redirect_to product_ftm_certification_url(@product_ftm_certification), notice: "Product ftm certification was successfully updated." }
        format.json { render :show, status: :ok, location: @product_ftm_certification }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_ftm_certification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_ftm_certifications/1 or /product_ftm_certifications/1.json
  def destroy
    @product_ftm_certification.destroy

    respond_to do |format|
      format.html { redirect_to product_ftm_certifications_url, notice: "Product ftm certification was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_ftm_certification
      @product_ftm_certification = ProductFtmCertification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_ftm_certification_params
      params.require(:product_ftm_certification).permit(:name, :desc, :code, :status)
    end
end
