class Admin::EnquiriesController < Admin::AdminbaseController
  before_action :set_enquiry, only: %i[show edit update destroy]

  def index
    @enquiries = if params[:search].present?
                  Enquiry.where('name LIKE ?', "%#{params[:search]}%")
                else
                  Enquiry.all
    end
  end

  def show
  end

  def new
    @enquiry = Enquiry.new
  end

  def create
    @enquiry = Enquiry.new(enquiry_params)
    if @enquiry.save
      redirect_to admin_enquiry_path(@enquiry), notice: 'Enquiry was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @enquiry.update(enquiry_params)
      redirect_to admin_enquiry_path(@enquiry), notice: 'Enquiry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @enquiry.destroy
    redirect_to admin_enquiries_url, notice: 'Enquiry was successfully destroyed.'
  end

  private

  def set_enquiry
    @enquiry = Enquiry.find(params[:id])
  end

  def enquiry_params
    params.require(:enquiry).permit(:designation, :email, :enquiry_type, :name, :organisation, :question, :subject)
  end
end
