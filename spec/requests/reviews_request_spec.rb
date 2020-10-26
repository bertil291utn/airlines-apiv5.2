require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  let(:review) { create :review }
  let(:title) { review.title }
  let(:description) { review.description }
  let(:score) { review.score }
  let(:airline_id) { review.airline_id }
  let(:user_id) { review.user_id }
  let(:params_review) { { review: { title: title, description: description, score: score, airline_id: airline_id } } }
  let(:headers) { { Authorization: JsonWebToken.encode(user_id: userId) } }

  describe 'update review' do
    let(:userId) { user_id }
    it 'returns 200' do
      put "/v1/reviews/#{review.id}", params: params_review, headers: headers
      expect(response).to have_http_status(:success)
    end
  end

  describe 'forbid update' do
    let(:user) { create :user }
    let(:userId) { user.id }
    it 'returns forbidden' do
      put "/v1/reviews/#{review.id}", params: params_review, headers: headers
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe 'create a review' do
    let(:userId) { user_id }
    it 'returns success response' do
      post '/v1/reviews', params: params_review, headers: headers
      expect(response).to have_http_status(:created)
    end
  end

  describe 'should not create a review' do
    it 'returns forbidden response' do
      post '/v1/reviews', params: params_review
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe 'should remove a review' do
    let(:userId) { user_id }
    it 'returns no content http response' do
      delete "/v1/reviews/#{review.id}", headers: headers
      expect(response).to have_http_status(:no_content)
    end
  end

  describe 'should forbid remove a review' do
    let(:user) { create :user }
    let(:userId) { user.id }
    it 'returns forbidden http response' do
      delete "/v1/reviews/#{review.id}", headers: headers
      expect(response).to have_http_status(:forbidden)
    end
  end
end
