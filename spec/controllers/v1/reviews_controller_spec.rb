require 'rails_helper'

RSpec.describe V1::ReviewsController, type: :controller do
  let(:review) { create :review }

  describe 'display reviews' do
    context 'GET #show/:id' do
      subject { get :show, params: { id: review.id } }
      it { should have_http_status(:success) }
    end

    context 'GET #index' do
      subject { get :index }
      it { should have_http_status(:success) }
    end
  end
end
