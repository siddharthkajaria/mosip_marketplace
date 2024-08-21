class Admin::ManufacturersController < Admin::AdminbaseController
  before_action :set_manufacturer, only: %i[show edit update destroy]

  def index
    @manufacturers = if params[:search].present?
      Manufacturer.fetch_all_manufacturers(params[:search])
    else
      Manufacturer.fetch_all_manufacturers
    end
  end

  def show
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def edit
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      redirect_to admin_manufacturer_path(@manufacturer), notice: 'Manufacturer was successfully created.'
    else
      render :new
    end
  end

  def update
    if @manufacturer.update(manufacturer_params)
      redirect_to admin_manufacturer_path(@manufacturer), notice: 'Manufacturer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @manufacturer.destroy
  end

  def download_sample_excel
    filepath = Rails.root.join('downloads', 'test_manu.xlsx')
    send_file(filepath, filename: 'sample_manufacturer.xlsx', type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
  end

  def upload_excel
    file = params[:file]

    if file.present?
      Manufacturer.import_from_excel file
      flash[:success] = "File uploaded successfully."
    else
      flash[:error] = "Please choose a file to upload."
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def set_manufacturer
    @manufacturer = Manufacturer.find(params[:id])
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :email_one, :email_two, :email_three, :phone_one, :phone_two, :phone_three, :address1, :address2, :address3, :desc, :website_link, :image)
  end
end
