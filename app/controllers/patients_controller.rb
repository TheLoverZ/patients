class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient.update_attribute(:view_count, @patient.view_count + 1)
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    @patient.location = Location.find(params.require(:patient).permit(:location_id)["location_id"])
    @patient.birthday = Date.new *flatten_date_array(params.require(:patient).permit(:birthday))

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: t("create_ok") }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: t("update_ok") }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    # update update status to true, instead of deleting it.
    @patient.update(deleted: true)
    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:first_name, :middle_name, :last_name, :gender, :status, :location_id)
    end

    # hash: {"birthday(1i)"=>"2014", "birthday(2i)"=>"4", "birthday(3i)"=>"22"}
    # return: [2014, 4, 22]
    def flatten_date_array(hash)
      %w(1 2 3).map { |e| hash["birthday(#{e}i)"].to_i }
    end
end
