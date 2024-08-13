class ProductSpecificationVersionsController < ApplicationController
  before_action :set_product_specification_version, only: %i[ show edit update destroy ]

  # GET /product_specification_versions or /product_specification_versions.json
  def index
    @product_specification_versions = ProductSpecificationVersion.all
  end

  # GET /product_specification_versions/1 or /product_specification_versions/1.json
  def show
  end

  # GET /product_specification_versions/new
  def new
    @product_specification_version = ProductSpecificationVersion.new
  end

  # GET /product_specification_versions/1/edit
  def edit
  end

  # POST /product_specification_versions or /product_specification_versions.json
  def create
    @product_specification_version = ProductSpecificationVersion.new(product_specification_version_params)

    respond_to do |format|
      if @product_specification_version.save
        format.html { redirect_to product_specification_version_url(@product_specification_version), notice: "Product specification version was successfully created." }
        format.json { render :show, status: :created, location: @product_specification_version }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_specification_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_specification_versions/1 or /product_specification_versions/1.json
  def update
    respond_to do |format|
      if @product_specification_version.update(product_specification_version_params)
        format.html { redirect_to product_specification_version_url(@product_specification_version), notice: "Product specification version was successfully updated." }
        format.json { render :show, status: :ok, location: @product_specification_version }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_specification_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_specification_versions/1 or /product_specification_versions/1.json
  def destroy
    @product_specification_version.destroy

    respond_to do |format|
      format.html { redirect_to product_specification_versions_url, notice: "Product specification version was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_specification_version
      @product_specification_version = ProductSpecificationVersion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_specification_version_params
      params.require(:product_specification_version).permit(:name, :desc, :code, :status)
    end
end
