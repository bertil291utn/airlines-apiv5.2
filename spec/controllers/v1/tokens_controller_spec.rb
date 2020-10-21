require 'rails_helper'

RSpec.describe V1::TokensController, type: :controller do
  describe 'GET #create' do
    let(:usuario) { create :user }
    context 'JWT token' do
      it 'returns JWT token' do
        user = { name: usuario.name, email: usuario.email, password: 'g00d_pa$$' }
        post :create, params: { user: user }, format: :json
        json_response = JSON.parse(response.body)
        expect(json_response['token']).not_to be_nil
      end

      subject { post :create, params: { user: { name: usuario.name, email: usuario.email, password: 'b@d_pa$$' } } }
      it { should have_http_status(:unauthorized) }
    end
  end
end
