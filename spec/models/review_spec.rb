require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it { should validate_numericality_of(:score).is_greater_than(0) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:score) }
  end
end
