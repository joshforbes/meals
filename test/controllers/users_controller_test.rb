require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: {
          user: {
              email: 'test@test.com',
              password: 'Tester12'
          }
      }, as: :json
    end

    assert_response 201
    assert_not_nil(User.find_by_email('test@test.com'))
  end

  test "should update user" do
    patch user_url(@user), params: {
        user: {
            email: 'test@test.com',
            password: 'Tester12'
        }
    }, as: :json

    @user.reload

    assert_response 200
    assert_equal('test@test.com', @user.email)
  end
end
