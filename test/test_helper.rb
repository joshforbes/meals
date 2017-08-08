require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  def json_response
    JSON.parse(response.body)
  end

  def auth_headers(user)
    {
        'HTTP_AUTHORIZATION': user.token.body,
        'HTTP_USER_EMAIL': user.email
    }
  end
end
