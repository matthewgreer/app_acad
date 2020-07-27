# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  username    :string           not null
#  location_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true 
	validates :password_digest, presence: true
	validates :password, length: { minimum: 6 }, allow_nil: true # will call .password on a User to check validations, we don't store passwords in the database so we need to allow the password to be nil since it won't be there after the user is created

	after_initialize :ensure_session_token # after .new, call ensure_session_token on the produced object (could also use before_validation)
	
	# why do we need this attr_reader?! 
	# if we don't, we will get an error when we try to validate a password (no method .password for User)
	# rails provides reader/writers for columns, but password isn't a column so we need to create these ourselves
	# attr_reader returns the instance variable of the same name, so we need to create the instance var in the passord= method so we can have this reader here
	attr_reader :password


  # create belongs_to for any foreign keys
  belongs_to :location, # :location is the name of this method, we can name it anything but choose something meaningful
    primary_key: :id, # primary_key should always be :id
    foreign_key: :location_id, #the foreign key in this table
    class_name: :Location  # table associated with the foreign key

  has_many :laughs,
    primary_key: :id,
    foreign_key: :author_id, # foreign_key for a has_many is the same foreign_key as the belongs_to half of the association
    class_name: :Laugh
	
	def self.find_by_credentials(username, password)
		user = User.find_by(username: username) # find_by will return nil if no matching username is found
		return nil unless user && user.is_password?(password) # is `user` truthy and is the password correct?, if `user` is nil or password is wrong, return nil
		user
	end

	def password=(password)
		@password = password # we need this for the validation (password attr_reader returns value of this instance variable)
		self.password_digest = BCrypt::Password.create(password)
		# here, BCrypt's `create` takes a plaintext password, salts and hashes it, and returns a digest
	end

	def reset_session_token! # `!` indicates that we touch our database
		self.session_token = self.class.generate_session_token
		self.save! # don't forget to save! the new session token needs to end up in the database
		# return the new session_token for convenience
		self.session_token
	end

	def is_password?(plaintext_password)
		# self.password_digest is just a string, so we first convert it to a bcrypt object
		bc_password = BCrypt::Password.new(self.password_digest)
			# BCrypt `new` method takes in a salted and hashed password and turns it into a BCrypt obj
		bc_password.is_password?(plaintext_password) # not using recursion, this is the `is_password?` method for BCrypt objects
		# here we use the BCrypt `is_password?`, an entirely different method from the one we're writing here 
	end

	private

	def ensure_session_token
		self.session_token ||= self.class.generate_session_token 
		# must be `||=` because when we query a User, .new gets called which would generate a new session token, which would mean the user is no longer logged in
	end

	def self.generate_session_token
		SecureRandom::urlsafe_base64 # just a random string
	end

end

