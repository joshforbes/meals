require 'test_helper'

class TokenTest < ActiveSupport::TestCase
  test 'a token can get the body' do
    user = create(:user)
    token = user.token

    body = token.body

    assert_equal(user.auth_token, body)
  end

  test 'a token can get the last used at' do
    user = create(:user)
    token = user.token

    last_used_at = token.last_used_at

    assert_equal(user.token_last_used_at, last_used_at)
  end

  test 'a token is active if not expired' do
    user = create(:user)
    token = user.token

    active = token.active?

    assert(active)
  end

  test 'using a token sets the last_used_at to now' do
    user = create(:user, token_last_used_at: 10.days.ago)
    token = user.token

    token.use

    assert_equal(Time.current.to_date, user.token.last_used_at.to_date)
  end

  test 'it knows if it is equal to a token string' do
    user = create(:user)
    token = user.token

    is_equal = token.compare_to(user.token.body)

    assert(is_equal)
  end

  test 'it knows if the tokens are not equal' do
    user = create(:user)
    token = user.token

    is_equal = token.compare_to('not-equal')

    refute(is_equal)
  end
end
