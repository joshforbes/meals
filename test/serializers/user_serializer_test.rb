require 'test_helper'

class UserSerializerTest < ActiveSupport::TestCase
  def serialized_user(user)
    {id: user.id, email: user.email, password_digest: user.password_digest}.to_json
  end

  test 'it serializes a user' do
    user = create(:user)
    serializer = UserSerializer.new(user)

    serialized = serializer.to_json

    assert_equal(serialized_user(user), serialized)
  end
end
