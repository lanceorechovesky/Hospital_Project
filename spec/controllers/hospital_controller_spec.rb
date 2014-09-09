require 'rails_helper'

describe HospitalsController do
  # describe "" do
  # end
  let(:hospital) { Hospital.create(name: "homebase", address: "yomoms house", phone_number: "000-0000") }

  it "GET #index" do
    sign_in
    get :index
    expect(assigns(:hospitals).class).to eq(Hospital::ActiveRecord_Relation)
  end

  describe "GET #show" do
    it 'should find an object and create a doctor' do
      sign_in
      get :show, id: hospital

      expect(assigns(:hospital)).to eq(hospital)
      expect(assigns(:hospital).class).to eq(Hospital)

      expect(assigns(:doctor).doctorable).to eq(hospital)
      expect(assigns(:doctor).class).to eq(Doctor)
    end
  end

  it 'GET #new' do
    sign_in
    get :new
    expect(assigns(:hospital).class).to eq(Hospital)
    expect(assigns(:hospital).new_record?).to eq(true)
  end

  describe "POST #create" do
    it 'created successfuly' do
      sign_in
      expect {
        post :create, hospital: {name: "homebase", address: "yomoms house", phone_number: "000-0000"}
      }.to change(Hospital, :count).by(1)
      expect(response).to redirect_to hospitals_path
    end
    it "failed to create your damn hospital" do
      sign_in
      expect{
        post :create, hospital: { name: "" }
      }.not_to change(Hospital, :count)
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it 'should find an object' do
      sign_in
      get :edit, id: hospital
      expect(assigns(:hospital)).to eq(hospital)
      expect(assigns(:hospital).class).to eq(Hospital)
    end
  end

  # describe "PATCH #update" do
  #   it 'updated successfuly' do
  #     sign_in
  #     patch :update, id: hospital
      
  #   end
  # end




end









