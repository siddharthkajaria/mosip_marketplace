class Admin::ProductFtmCertificationsController < Admin::AdminbaseController
  before_action :set_product_ftm_certification, only: [:show, :edit, :update, :destroy]

  def index
    # @product_ftm_certifications = ProductFtmCertification.all

    @product_ftm_certifications = if params[:search].present?
                    ProductFtmCertification.fetch_all_certification(params[:search])
                  else
                    ProductFtmCertification.fetch_all_certification
                  end
  end

  def show
  end

  def new
    @product_ftm_certification = ProductFtmCertification.new
  end

  def create
    @product_ftm_certification = ProductFtmCertification.new(product_ftm_certification_params)
    @product_ftm_certification.code = product_ftm_certification_params[:name].parameterize.underscore
    if @product_ftm_certification.save
      redirect_to admin_product_ftm_certification_path(@product_ftm_certification), notice: 'Product FTM Certification was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product_ftm_certification.update(product_ftm_certification_params)
      redirect_to admin_product_ftm_certification_path(@product_ftm_certification), notice: 'Product FTM Certification was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product_ftm_certification.destroy
  end

  private

  def set_product_ftm_certification
    @product_ftm_certification = ProductFtmCertification.find(params[:id])
  end

  def product_ftm_certification_params
    params.require(:product_ftm_certification).permit(:name, :desc, :code, :status)
  end
end
