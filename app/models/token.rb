class Token < ApplicationRecord
  EXPIRES = 7.days.ago

  belongs_to :user
  has_secure_token :body

  def active?
    last_used_at >= EXPIRES
  end

  def use
    self.last_used_at = DateTime.now
    save!
    self
  end

  def compare_to(token_body)
    ActiveSupport::SecurityUtils.secure_compare(body, token_body)
  end
end
