require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'delete airline' do
    let(:airline) { create :airline }
    let(:review) { create :review }
    it { expect(airline).to have_many(:reviews).dependent(:destroy) }
  end
end
