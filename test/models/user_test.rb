require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user with a valid email should pass" do
    user = User.new(email: "mytest@email.com", password_digest: "hashed_password")
    assert user.valid?
  end

  test "user with invalid email should not pass" do
    user = User.new(email: "testnonemail", password_digest: "testpassword")
    assert_not user.valid?
  end

  test "user with taken email should be invalid" do
    one_user = users(:one)
    user = User.new(email: one_user.email, password_digest: "testpassword")
    assert_not user.valid?
  end
end
