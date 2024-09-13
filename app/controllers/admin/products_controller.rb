class Admin::ProductsController < Admin::AdminbaseController
    before_action :set_product, only: %i[show edit update destroy]
  
    def index
    #   @products = Product.all
      @products = if params[:search].present?
                        Product.fetch_all_product(params[:search])
                    else
                        Product.fetch_all_product
                    end
    end
  
    def show
    end
  
    def new
      @product = Product.new
    end
  
    def create
      @product = Product.new(product_params)
  
      if @product.save
        redirect_to admin_product_path(@product), notice: 'Product was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
            
      if @product.update(product_params)
        redirect_to admin_product_path(@product), notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @product.destroy
    end

    def download_sample_excel
      filepath = Rails.root.join('downloads', 'pdt_demo.xlsx')
      send_file(filepath, filename: 'sample_product.xlsx', type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    end
  
    def upload_excel
      file = params[:file]
  
      if file.present?
        Product.import_from_excel file
        flash[:success] = "File uploaded successfully."
      else
        flash[:error] = "Please choose a file to upload."
      end
  
      respond_to do |format|
        format.js
      end
    end
  
    private
  
    def set_product
      @product = Product.find(params[:id])
    end
  
    def product_params
      params.require(:product).permit(
        :name, :short_description, :model, :firmware_version, :software_version,
        :ftm_chip_make_and_model, :print_software_version, :integration_methodology,
        :full_specifications, :usage, :additional_components, :global_certifications,:additional_feature,
        :macp_certification_link, :sbi_version, :mosip_compliance, :mosip_integration,
        :certified, :manufacturer_id, :category_id, :mosip_compliance_status_id,
        :product_ftm_certification_id, :product_specification_version_id, 
        biometric_ids: [], product_images_attributes: [:id, :image, :_destroy]
      )
    end
  end
  