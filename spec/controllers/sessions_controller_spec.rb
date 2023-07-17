require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let(:user) { FactoryBot.create(:user, email: 'test@example.com', password: 'password', role: 'patient', name: 'John Doe') }
  let(:body) { JSON.parse(response.body) }

  describe 'POST #signup' do
    context 'when the user is successfully created' do
      it 'returns a token' do
        post :signup, params: { email: 'test@example.com', password: 'password', role: 'patient', name: 'John Doe' }
        expect(response).to have_http_status(:success)
      end
    end

    context 'returns "invalid credentials" message' do
      it 'returns a token' do
        post :signup
        expect(body['message']).to eq('invalid credentials')
      end
    end
  end

  describe 'POST #login' do
    context 'when the login credentials are valid' do
      it 'returns a token' do
        post :login, params: { email: 'test@example.com', password: 'password' }
        expect(response).to have_http_status(:success)
      end
    end

    context 'when the login credentials are invalid' do
      it 'returns an error message' do
        post :login, params: { email: 'test@example.com', password: 'wrong_password' }
        expect(body['message']).to eq('invalid credentials')
      end
    end
  end
end
