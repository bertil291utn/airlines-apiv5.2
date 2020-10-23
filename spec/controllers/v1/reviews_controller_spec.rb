require 'rails_helper'

RSpec.describe V1::ReviewsController, type: :controller do
  let(:review) { create :review }

  describe 'GET #show/:id' do
    subject { get :show, params: { id: review.id } }
    it { should have_http_status(:success) }
  end

  describe 'GET #index' do
    subject { get :index }
    it { should have_http_status(:success) }
  end

  describe 'create a review' do
    let(:review) { create :review }
    it 'returns created status, created by verified user' do
      request.headers['Authorization'] = JsonWebToken.encode(user_id: review.user_id)
      post :create, params: { review: { title: review.title, description: review.description, score: review.score } }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'should forbid create a review' do
    subject { post :create, params: { title: review.title, description: review.description, score: review.score } }
    it { should have_http_status(:forbidden) }
  end
end
