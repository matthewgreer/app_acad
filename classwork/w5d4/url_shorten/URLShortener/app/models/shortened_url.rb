# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint           not null, primary key
#  long_url  :string           not null
#  short_url :string           not null
#  user_id   :integer          not null
#
class ShortenedUrl < ApplicationRecord
    validates :user_id, presence: true
    validates :long_url, presence: true
    validates :short_url, uniqueness: true, presence: true

    belongs_to(:submitter, {
        class_name: :User,
        primary_key: :id,
        foreign_key: :user_id
    })

    has_many(:visits, {
        class_name: :Visit,
        primary_key: :id,
        foreign_key: :shortened_url_id
    })

    has_many(:visitors, {
        through: :visits,
        source: :visitor
    })

    def self.random_code
        code = SecureRandom.urlsafe_base64
        ShortenedUrl.exists?(:short_url => code) ? ShortenedUrl.random_code : code
    end

    def self.generate(user, long_url)
        ShortenedUrl.create!(
            user_id: user.id,
            long_url: long_url,
            short_url: ShortenedUrl.random_code
        )
    end
end


