require 'spec_helper'

describe PatientsController do

  let(:valid_attributes) { {
      "first_name" => "foo",
      "last_name" => "bar",
      "status" => "initial",
      "gender" => "male",
      "location_id" => Location.first.id,
      "birthday(1i)" => "2014",
      "birthday(2i)" => "4",
      "birthday(3i)" => "22",
    } }

  before :each do
    Patient.destroy_all
  end

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all patients as @patients" do
      patient = Patient.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:patients)).to eq([patient])
    end
  end

  describe "GET show" do
    it "assigns the requested patient as @patient" do
      patient = Patient.create! valid_attributes
      get :show, {:id => patient.to_param}, valid_session
      expect(assigns(:patient)).to eq(patient)
    end
    it "increase patient's view count" do
      patient = Patient.create! valid_attributes
      get :show, {:id => patient.to_param}, valid_session
      expect(assigns(:patient).view_count).to eq 1
      get :show, {:id => patient.to_param}, valid_session
      expect(assigns(:patient).view_count).to eq 2
    end
  end

  describe "GET new" do
    it "assigns a new patient as @patient" do
      get :new, {}, valid_session
      expect(assigns(:patient)).to be_a_new(Patient)
    end
  end

  describe "GET edit" do
    it "assigns the requested patient as @patient" do
      patient = Patient.create! valid_attributes
      get :edit, {:id => patient.to_param}, valid_session
      expect(assigns(:patient)).to eq(patient)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Patient" do
        expect {
          post :create, {:patient => valid_attributes}, valid_session
        }.to change(Patient, :count).by(1)
      end

      it "assigns a newly created patient as @patient" do
        post :create, {:patient => valid_attributes}, valid_session
        expect(assigns(:patient)).to be_a(Patient)
        expect(assigns(:patient)).to be_persisted
      end

      it "redirects to the created patient" do
        post :create, {:patient => valid_attributes}, valid_session
        expect(response).to redirect_to(Patient.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved patient as @patient" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Patient).to receive(:save).and_return(false)
        post :create, {:patient => valid_attributes }, valid_session
        expect(assigns(:patient)).to be_a_new(Patient)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Patient).to receive(:save).and_return(false)
        post :create, {:patient => valid_attributes }, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested patient" do
        patient = Patient.create! valid_attributes
        # Assuming there are no other patients in the database, this
        # specifies that the Patient created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Patient).to receive(:update).with({ "first_name" => "MyString" })
        put :update, {:id => patient.to_param, :patient => { "first_name" => "MyString" }}, valid_session
      end

      it "assigns the requested patient as @patient" do
        patient = Patient.create! valid_attributes
        put :update, {:id => patient.to_param, :patient => valid_attributes}, valid_session
        expect(assigns(:patient)).to eq(patient)
      end

      it "redirects to the patient" do
        patient = Patient.create! valid_attributes
        put :update, {:id => patient.to_param, :patient => valid_attributes}, valid_session
        expect(response).to redirect_to(patient)
      end
    end

    describe "with invalid params" do
      it "assigns the patient as @patient" do
        patient = Patient.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Patient).to receive(:save).and_return(false)
        put :update, {:id => patient.to_param, :patient => { "first_name" => "invalid value" }}, valid_session
        expect(assigns(:patient)).to eq(patient)
      end

      it "re-renders the 'edit' template" do
        patient = Patient.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Patient).to receive(:save).and_return(false)
        put :update, {:id => patient.to_param, :patient => { "first_name" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested patient" do
      patient = Patient.create! valid_attributes
      expect {
        delete :destroy, {:id => patient.to_param}, valid_session
      }.to change(Patient, :count).by(-1)
    end

    it "redirects to the patients list" do
      patient = Patient.create! valid_attributes
      delete :destroy, {:id => patient.to_param}, valid_session
      expect(response).to redirect_to(patients_url)
    end

    it "updates deleted status to true" do
      patient = Patient.create! valid_attributes
      delete :destroy, {:id => patient.to_param}, valid_session
      expect(response).to redirect_to(patients_url)
      expect(patient.reload.deleted).to eq true
    end
  end

end
