require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  describe 'GET#show/:id' do
    let(:usuario) { create :user }
    subject { get :show, params: { id: usuario.id } }
    it { should have_http_status(:success) }

    it 'returns same email as the object email' do
      get :show, params: { id: usuario.id }, format: :json
      json_response = JSON.parse(response.body)
      expect(json_response['email']).to match(usuario.email)
    end
  end

  describe 'create new user' do
    subject(:usuario) { create :user }
    subject { post :create, params: { name: usuario.name, email: usuario.email, password: usuario.password_digest } }
    it { expect(response).to have_http_status(:success) }
  end
end