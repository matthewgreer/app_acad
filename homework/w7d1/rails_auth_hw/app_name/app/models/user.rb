# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord

  before_validation :ensure_session_token
  
  validates :username, 
    presence: { message: "Name cannot be blank" }, 
    uniqueness: { message: "That username is taken." }
  validates :password,
    length: { in: 6..20, message: "Password must be 6 - 20 characters long.", allow_nil: true }
  validates :session_token, 
    presence: true
  validates :password_digest,
    presence: { message: "Password cannot be blank"}

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    BCrypt::Password.new(user.password_digest).is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end

  def password=(value)
    @password = value
    self.password_digest = BCrypt::Password.create(@password)
  end
  
  
  private
  
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
    
end
