class Admin::ProductSpecificationVersionsController < Admin::AdminbaseController
    before_action :set_product_specification_version, only: [:show, :edit, :update, :destroy]
  
    def index
    #   @product_specification_versions = ProductSpecificationVersion.all
      @product_specification_versions = if params[:search].present?
                                            ProductSpecificationVersion.fetch_all_version(params[:search])
                                        else
                                            ProductSpecificationVersion.fetch_all_version
                                        end
    end
  
    def show
    end
  
    def new
      @product_specification_version = ProductSpecificationVersion.new
    end
  
    def create
      @product_specification_version = ProductSpecificationVersion.new(product_specification_version_params)
      @product_specification_version.code = product_specification_version_params[:name].parameterize.underscore
      if @product_specification_version.save
        redirect_to admin_product_specification_version_path(@product_specification_version), notice: 'Product specification version was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @product_specification_version.update(product_specification_version_params)
        redirect_to admin_product_specification_version_path(@product_specification_version), notice: 'Product specification version was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @product_specification_version.destroy
    end
  
    private
  
    def set_product_specification_version
      @product_specification_version = ProductSpecificationVersion.find(params[:id])
    end
  
    def product_specification_version_params
      params.require(:product_specification_version).permit(:name, :desc)
    end
  end
  