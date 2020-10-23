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
    subject { post :create, params: { title: review.title, description: review.description, score: review.score }, headers: { Authorization: JsonWebToken.encode(user_id: review.user_id) } }
    it { should have_http_status(:created) }
  end

  describe 'should forbid create a review' do
    subject { post :create, params: { title: review.title, description: review.description, score: review.score } }
    it { should have_http_status(:forbidden) }
  end
end
