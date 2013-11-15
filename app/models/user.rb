class User < ActiveRecord::Base
  attr_accessible :email, :pwrd_digest, :session_token

  validates :email, :pwrd_digest, :session_token, presence: true
  validates :email, uniqueness: true

  def password=(pwrd)
    self.pwrd_digest = BCrypt::Password.create(pwrd)
  end

  def is_password?(pwrd_attempt)
    BCrypt::Password.new(self.pwrd_digest).is_password?(pwrd_attempt)
  end
end
