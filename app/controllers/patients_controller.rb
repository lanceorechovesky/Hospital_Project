class PatientsController < ApplicationController
  before_action :find_hospital, only: [:index, :search_hospital_patients, :show, :new, :create, :edit, :update, :destroy, :create_doctor, :destroy_doctor, :with_dr, :admitted, :test, :surgery, :prep_dis, :pay_bill]
  before_action :find_patient, only: [:show, :edit, :update, :destroy]
  def index
    @patients = Patient.all
    respond_to do |format|
      format.js
      format.html
    end
  end

  def search_hospital_patients
    @patients = @hospital.patients.where("first_name LIKE ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end

  def show
    @doctor = @patient.doctors.new
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = @hospital.patients.new(patient_data)
    if @patient.save == true
      redirect_to hospital_patients_path(@hospital)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update_attributes patient_data
      redirect_to hospital_patient_path
    else
      render :edit
    end
  end

  def destroy
    @patient.delete
    redirect_to hospital_patients_path(@hospital)
  end

  def create_doctor
    @patient = @hospital.patients.find params[:id]
    @doctors = @patient.doctors.create doc_data
    redirect_to hospital_patient_path(@hospital, @patient)
  end

  def destroy_doctor
    @patient = @hospital.patients.find params[:id]
    @doctor = @patient.doctors.find params[:doctor_id]
    @doctor.delete
    redirect_to hospital_patient_path(@hospital, @patient)
  end

  def with_dr
    @patient_id = @hospital.patients.find params[:id]
    @patient = find_patient.seeing_dr!
    redirect_to hospital_patient_path(@hospital, @patient_id)
  end

  def admitted
    @patient_id = @hospital.patients.find params[:id]
    @patient = find_patient.admitting!
    redirect_to hospital_patient_path(@hospital, @patient_id)
  end

  def test
    @patient_id = @hospital.patients.find params[:id]
    @patient = find_patient.testing!
    redirect_to hospital_patient_path(@hospital, @patient_id)
  end

  def surgery
    @patient_id = @hospital.patients.find params[:id]
    @patient = find_patient.cutting!
    redirect_to hospital_patient_path(@hospital, @patient_id)
  end

  def prep_dis
    @patient_id = @hospital.patients.find params[:id]
    @patient = find_patient.preping!
    redirect_to hospital_patient_path(@hospital, @patient_id)
  end

  def pay_bill
    @patient_id = @hospital.patients.find params[:id]
    @patient = find_patient.leaving!
    redirect_to hospital_patient_path(@hospital, @patient_id)
  end
  
private
  # def find_doctor
  #   @doctor = Doctor.find params[:doctor_id]
  # end

  def find_hospital
    @hospital = Hospital.find params[:hospital_id]
  end

  def find_patient
    @patient = Patient.find params[:id]
  end

  def patient_data
     params.require(:patient).permit(:first_name, :last_name, :dob, :complaint, :sex, :workflow_state, :postdis_commit, :hospital_id)
  end

  def doc_data
    params.require(:doctor).permit(:name)
  end
end
