class MedicationsController < ApplicationController
  before_action :find_hospital, only: [:search_patient_medications, :index, :show, :new, :create, :edit, :update]
  before_action :find_patient, only: [:search_patient_medications, :index, :show, :new, :create, :edit, :update]

  def index
    @medications = Medication.all
    respond_to do |format|
      format.js
      format.html
    end
  end

  def search_patient_medications
    @medications = @patient.medications.where("name LIKE ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end

  def show
    @medication = find_med
  end

  def new
    @medication = Medication.new
  end

  def create
    @medication = @patient.medications.new(med_data)
    if @medication.save == true
    redirect_to hospital_patient_medications_path(@hospital, @patient)
    else
      render :new
    end
  end

  def edit
    @medication = find_med
  end

  def update
    @medication = find_med
    if @medication.update_attributes med_data
      redirect_to hospital_patient_medication_path
    else
      render :edit
    end
  end

  def destroy
    @medication = find_med
    @medication.delete
    redirect_to hospital_patient_medications_path
  end

private
  def find_hospital
    @hospital = Hospital.find params[:hospital_id]
  end

  def find_patient
    @patient = Patient.find params[:patient_id]
  end

  def find_med
    @medication = Medication.find params[:id]
  end

  def med_data
    params.require(:medication).permit(:name, :patient_id, :dose, :restricted)
  end



end
