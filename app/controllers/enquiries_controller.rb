class EnquiriesController < ApplicationController
  before_action :set_enquiry, only: %i[ show edit update destroy ]

  # GET /enquiries or /enquiries.json
  def index
    @enquiry = Enquiry.new
    @enquiries = Enquiry.all
  end

  # GET /enquiries/1 or /enquiries/1.json
  def show
  end

  # GET /enquiries/new
  def new
    @enquiry = Enquiry.new
  end

  # GET /enquiries/1/edit
  def edit
  end

  # def verify_recaptcha(response)
  #   secret_key = ENV['RECAPTCHA_SECRET_KEY']
  #   uri = URI.parse("https://www.google.com/recaptcha/api/siteverify")
  #   request = Net::HTTP.post_form(uri, {
  #     'secret' => secret_key,
  #     'response' => response
  #   })
  #   JSON.parse(request.body)['success']
  # end

  # POST /enquiries or /enquiries.json
  def create
      @enquiry = Enquiry.new(enquiry_params)
      a = verify_recaptcha(model: @enquiry)
      p a
      p "____________"
      if a
        if @enquiry.save
          respond_to do |format|
            format.html { redirect_to new_enquiry_path, notice: 'Enquiry was successfully created.' }
            format.json { render json: { success: true, message: 'Enquiry submitted successfully!' } }
          end
        else
          respond_to do |format|
            format.html { render :new }
            format.json { render json: { success: false, errors: @enquiry.errors.full_messages }, status: :unprocessable_entity }
          end
        end
      else
        # reCAPTCHA failed
        respond_to do |format|
          format.html { render :new, alert: 'reCAPTCHA verification failed. Please try again.' }
          format.json { render json: { success: false, errors: ['reCAPTCHA verification failed. Please try again.'] }, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /enquiries/1 or /enquiries/1.json
  def update
    respond_to do |format|
      if @enquiry.update(enquiry_params)
        format.html { redirect_to enquiry_url(@enquiry), notice: "Enquiry was successfully updated." }
        format.json { render :show, status: :ok, location: @enquiry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enquiries/1 or /enquiries/1.json
  def destroy
    @enquiry.destroy

    respond_to do |format|
      format.html { redirect_to enquiries_url, notice: "Enquiry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enquiry
      @enquiry = Enquiry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enquiry_params
      params.require(:enquiry).permit(:name, :email, :enquiry_type, :question, :designation, :organisation, :subject)
    end
end
