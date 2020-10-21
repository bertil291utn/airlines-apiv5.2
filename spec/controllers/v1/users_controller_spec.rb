require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  let(:usuario) { create :user }
  describe 'GET#show/:id' do
    subject { get :show, params: { id: usuario.id } }
    it { should have_http_status(:success) }

    it 'returns same email as the object email' do
      get :show, params: { id: usuario.id }, format: :json
      json_response = JSON.parse(response.body)
      expect(json_response['email']).to match(usuario.email)
    end
  end
end
