# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    before_validation :ensure_session_token # after_initialize?
    validates :user_name, presence: true, uniqueness: true
    validates :password, length: { in: 6..20 }
    validates :session_token, presence: true, uniqueness: true

    has_many :cats,
      foreign_key: :user_id,
      class_name: :Cat

    attr_reader :password

    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name)
        return nil unless user && user.is_password?(password)
        user
    end

    def reset_session_token!
      self.session_token = User.generate_session_token
      self.save!
      self.session_token
    end

    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
      bc_pw = BCrypt::Password.new(self.password_digest)
      bc_pw.is_password?(password)
    end

    private

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def self.generate_session_token # private?
        SecureRandom::urlsafe_base64
    end


end
