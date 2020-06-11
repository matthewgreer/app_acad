class ShortenedUrl < ApplicationRecord
    validates :user_id, uniqueness: true, presence: true
    validates :long_url, presence: true
    validates :short_url, uniqueness: true, presence: true

    def self.random_code
        code = SecureRandom.urlsafe_base64
        ShortenedUrl.exists?(:short_url => code) ? ShortenedUrl.random_code : code
    end

    def self.generate(user, long_url)
        ShortenedUrl.create!(
            id: user,
            long_url: long_url,
            short_url: ShortenedUrl.random_code
        )
    end
end


# INSERT INTO
#   users (fname, lname)
# VALUES
#   ("Ned", "Ruggeri"), ("Kush", "Patel"), ("Earl", "Cat");


# a =  ShortenedUrl.create!('./adfads', ShortenedUrl.random_code, 5)
