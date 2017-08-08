require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should authenticate the user and return their token' do
    user = create(:user)

    post sessions_url, params: {
        user: {
            email: user.email,
            password: user.password
        }
    }, as: :json

    assert_response 200
    assert_equal user.token.body, json_response['token']
  end

  test 'does not authenticate with an invalid password' do
    user = create(:user)

    post sessions_url, params: {
        user: {
            email: user.email,
            password: 'Invalid Password'
        }
    }, as: :json

    assert_response 401
  end

  test 'should destroy the current users token' do
    user = create(:user)
    original_token = user.token.body

    delete sessions_url, as: :json, headers: auth_headers(user)

    assert_response 204
    assert_not_equal original_token, user.reload.token.body
  end
end
