require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6).on(:create) }
  end

  describe "#is_password?" do
    
    context "with correct password" do
      it "returns true" do
        user = User.new(email: "rspecsux@truth.org", password: "fuckthis")
        expect(user.is_password?("fuckthis")).to be_truthy
      end
    end

    context "with invalid password" do
      it "returns false" do
        user = User.new(email: "rspecsux@truth.org", password: "fuckthis")
        expect(user.is_password?("banana")).to be_falsey
      end
    end
  end

  describe "#reset_session_token!" do
      it "returns a new session token" do
         user = User.new(email: "rspecsux@truth.org", password: "fuckthis")
         user.session_token = SecureRandom::urlsafe_base64(16)
         old_token = user.session_token
         expect(user.reset_session_token!).not_to eq(old_token)
      end
  end

  describe "::find_by_credentials" do
    context "when credentials match user in database" do
      it "returns a User instance" do
        user = User.new(email: "rspecsux@truth.org", password: "fuckthis")
        user.save!
        expect(User.find_by_credentials("rspecsux@truth.org", "fuckthis")).to be_instance_of(User)
      end
    end

    context "when credentials do not match user in database" do
      it "returns nil" do
        expect(User.find_by_credentials("rspecsux@truth.org", "fuckthis")).to be_nil
      end
    end
  end
    

end
