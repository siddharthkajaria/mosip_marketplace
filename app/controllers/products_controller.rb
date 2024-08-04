class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    per_page = 1
    # binding.irb
    @products = Product.all.paginate(page: params[:page], per_page: per_page)
    @uniq_pdt_category = Product.joins(:category).pluck('categories.name').uniq
    @uniq_pdt_names = Product.pluck('name').uniq


    # Check if the request contains any filter parameters
    filter_params = [:device_category, :biometrics, :mosip_version, :mosip_compliance_status, :macp_certified, :product_name]
    filter_applied = params.slice(*filter_params).present?


    if filter_applied
      @products = (Product.filtered_product params).paginate(page: params[:page], per_page: per_page)
    end

    # if params[:q].present?
      @q = @products.ransack(params[:q])
      @products = @q.result(distinct: true).paginate(page: params[:page], per_page: per_page)
    # end

    respond_to do |format|
      format.html # if someone requests HTML format
      format.js   # if someone requests JavaScript format
    end
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      def product_params
        params.require(:product).permit(
          :name, :short_description, :manufacturer_id, :model, :supported_biometric_modalities,
          :additional_components, :macp_certification_link, :sbi_version, :global_certifications,
          :ftm_certification, :ftm_chip_make_and_model, :firmware_version, :software_version,
          :full_specifications, :usage, :print_software_version, :integration_methodology,
          :category_id, :mosip_compliance_status_id, :additional_feature,
          product_images_attributes: [:id, :image_data, :position, :status, :_destroy]
        )
      end
    end
end
