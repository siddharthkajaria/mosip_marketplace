class Admin::SiPartnershipsController < Admin::AdminbaseController
  before_action :set_si_partnership, only: [:show, :edit, :update, :destroy]

  def index
    @si_partnerships = if params[:search].present?
                         SiPartnership.where('name LIKE ?', "%#{params[:search]}%")
                       else
                         SiPartnership.all
                       end
  end

  def show
  end

  def new
    @si_partnership = SiPartnership.new
  end

  def create
    @si_partnership = SiPartnership.new(si_partnership_params)
    @si_partnership.code = si_partnership_params[:name].parameterize.underscore

    if @si_partnership.save
      redirect_to admin_si_partnership_path(@si_partnership), notice: 'SI Partnership was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @si_partnership.update(si_partnership_params)
      redirect_to admin_si_partnership_path(@si_partnership), notice: 'SI Partnership was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @si_partnership.destroy
  end

  private

  def set_si_partnership
    @si_partnership = SiPartnership.find(params[:id])
  end

  def si_partnership_params
    params.require(:si_partnership).permit(:name, :desc, :code, :status, :address1, :address2, :address3, 
                                           :email_one, :email_two, :email_three, :phone_one, :phone_two, 
                                           :phone_three, :website_link, :image)
  end
end
