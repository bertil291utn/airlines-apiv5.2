require 'rails_helper'

RSpec.describe V1::ReviewsController, type: :controller do
  let(:review) { create :review }

  describe 'display reviews' do
    context 'returns a succes http response for one review' do
      subject { get :show, params: { id: review.id } }
      it { should have_http_status(:success) }
    end

    context 'returns succes http response for all reviews' do
      subject { get :index }
      it { should have_http_status(:success) }
    end

    describe 'should show all reviews json formatted' do
      before do
        get :show, params: { id: review.id }, format: :json
      end
      let(:json_response) { JSON.parse(response.body, symbolize_names: true) }

      it 'shows same title' do
        expect(json_response.dig(:data, :attributes, :title)).to match(review.title)
      end

      it 'shows user id' do
        expect(json_response.dig(:data, :relationships, :user, :data, :id)).to match(review.user.id.to_s)
      end

      it 'shows same email' do
        expect(json_response.dig(:included, 0, :attributes, :email)).to match(review.user.email)
      end
    end
  end
end
