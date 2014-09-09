class HospitalsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_hospital, only: [:show, :edit, :update, :destroy, :create_doctor, :destroy_doctor]

  def index
    @hospitals = Hospital.all
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @doctor = @hospital.doctors.new
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.create hospital_data
    if @hospital.save == true
      redirect_to hospitals_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @hospital.update_attributes hospital_data
      redirect_to hospital_path(@hospital)
    else
      render :edit
    end
  end

  def destroy
    @hospital.delete
    redirect_to hospitals_path
  end

  def with_dr
    @hospital = find_hospital.seeing_dr!
    redirect_to hospital_patients_path(@hospital)
  end

  def create_doctor
    @hospital.doctors.create doc_data
    redirect_to @hospital
  end

  def destroy_doctor
    @doctor = find_doc
    @doctor.delete
    redirect_to @hospital
  end

  def search_hospitals
    @hospitals = Hospital.where("name LIKE ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end
  
private
  def find_doc
    @doctor = Doctor.find params[:doctor_id]
  end

  def find_hospital
    @hospital = Hospital.find params[:id]
  end

  def hospital_data
    params.require(:hospital).permit(:name, :address, :phone_number, :workflow_state)
  end

  def doc_data
    params.require(:doctor).permit(:name)
  end
end






