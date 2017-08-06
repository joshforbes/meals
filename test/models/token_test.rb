require 'test_helper'

class TokenTest < ActiveSupport::TestCase
  test 'a token is active if not expired' do
    token = build(:token)

    active = token.active?

    assert(active)
  end

  test 'using a token sets the last_used_at to now' do
    token = create(:token, last_used_at: 10.days.ago)

    token = token.use

    assert_equal(DateTime.now.to_date, token.reload.last_used_at.to_date)
  end

  test 'it knows if it is equal to a token string' do
    token = build(:token)

    is_equal = token.compare_to(token.body)

    assert(is_equal)
  end

  test 'it knows if the tokens are not equal' do
    token = build(:token)

    is_equal = token.compare_to('not-equal')

    refute(is_equal)
  end
end
