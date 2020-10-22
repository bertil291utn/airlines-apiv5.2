require 'rails_helper'

RSpec.describe V1::ReviewsController, type: :controller do
  describe 'GET #show' do
    let(:airline) { create :airline }
    let(:review) { create :review }
    subject { get :show, params: { id: review.id } }
    it { should have_http_status(:success) }
  end
end
