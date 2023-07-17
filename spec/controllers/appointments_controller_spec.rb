require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  let!(:patient) { FactoryBot.create(:patient) }
  let!(:doctor) { FactoryBot.create(:doctor) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: { patient_id: patient.id }
      expect(response).to have_http_status(:success)
    end

    it 'assigns the appointments of the patient' do
      appointment = FactoryBot.create(:appointment, patient: patient)
      get :index, params: { patient_id: patient.id }
      expect(assigns(:appointments)).to eq([appointment])
    end
  end

  describe 'POST #create' do
    let(:valid_params) do
      {
        patient_id: patient.id,
        appointment: {
          appointment_time: Time.now,
          doctor_id: doctor.id,
          reason: 'Some reason',
          room_number: 'A123',
          fee: 100,
          duration: 30
        }
      }
    end

    context 'with valid parameters' do
      it 'creates a new appointment' do
        expect {
          post :create, params: valid_params
        }.to change(Appointment, :count).by(1)
      end

      it 'returns a success response' do
        post :create, params: valid_params
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        valid_params.merge(appointment: { appointment_time: nil })
      end

      it 'does not create a new appointment' do
        expect {
          post :create, params: invalid_params
        }.to_not change(Appointment, :count)
      end

      it 'returns an unprocessable entity response' do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
