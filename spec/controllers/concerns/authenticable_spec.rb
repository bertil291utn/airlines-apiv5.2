require 'rails_helper'
# require_relative '../app/controllers/concerns/authenticable'

class MockController
  include Authenticable
  attr_accessor :request

  def initialize
    mock_request = Struct.new(:headers)
    self.request = mock_request.new({})
  end
end

describe 'Authorized JWT token' do
  let(:user) { create :user }
  let(:authentication) { MockController.new }
  it 'should get user from Authorization token' do
    authentication.request.headers['Authorization'] = JsonWebToken.encode(user_id: user.id)
    expect(authentication.current_user.id).to be(user.id)
  end

  it 'should not get uer from empty Athorization token' do
    authentication.request.headers['Authorization'] = nil
    expect(authentication.current_user).to be_nil
  end
end
