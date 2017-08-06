require 'test_helper'
require_relative '../../lib/token_strategy'

class TokenStrategyTest < ActiveSupport::TestCase
  test "is valid if valid credentials" do
    ENV["HTTP_USER_EMAIL"] = 'test@test.com'
    ENV["HTTP_AUTHORIZATION"] = 'abcdef'
    strategy = TokenStrategy.new(ENV)

    valid = strategy.valid?

    assert valid
  end

  test "authentication succeeds with valid email and token" do
    token = create(:token)
    user = token.user
    ENV["HTTP_USER_EMAIL"] = user.email
    ENV["HTTP_AUTHORIZATION"] = token.body
    strategy = TokenStrategy.new(ENV)

    auth_status = strategy.authenticate!

    assert_equal(:success, auth_status)
  end

  test "fails authentication if the email does not exist" do
    ENV["HTTP_USER_EMAIL"] = 'test@test.com'
    strategy = TokenStrategy.new(ENV)

    auth_status = strategy.authenticate!

    assert_equal(:failure, auth_status)
  end

  test "fails authentication if the tokens do not match" do
    token = create(:token)
    user = token.user
    ENV["HTTP_USER_EMAIL"] = user.email
    ENV["HTTP_AUTHORIZATION"] = 'abcdef'
    strategy = TokenStrategy.new(ENV)

    auth_status = strategy.authenticate!

    assert_equal(:failure, auth_status)
  end
end
