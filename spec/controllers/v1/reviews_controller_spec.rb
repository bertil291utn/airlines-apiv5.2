require 'rails_helper'

RSpec.describe V1::ReviewsController, type: :controller do
  let(:airline) { create :airline }
  let(:review) { create :review }

  describe 'GET #show/:id' do
    subject { get :show, params: { id: review.id } }
    it { should have_http_status(:success) }
  end

  describe 'GET #index' do
    subject { get :index }
    it { should have_http_status(:success) }
  end
end
