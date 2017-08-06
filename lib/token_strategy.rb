class TokenStrategy < ::Warden::Strategies::Base

  def valid?
    user_email_from_headers.present? && token_from_headers.present?
  end

  def authenticate!
    failure_message = "Authentication failed"

    user = User.find_by_email(user_email_from_headers)
    return fail!(failure_message) unless user

    if user.token.compare_to(token_from_headers) && user.token.active?
      user.token.use
      return success!(user)
    end

    fail!(failure_message)
  end

  def store?
    false
  end

  private

  def user_email_from_headers
    env["HTTP_USER_EMAIL"]
  end

  def token_from_headers
    env["HTTP_AUTHORIZATION"]
  end
end