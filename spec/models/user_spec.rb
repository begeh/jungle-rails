require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject{User.new(first_name: "Jim", last_name: "Bob", email: 'jim_bob@gmail.com', password: "123", password_confirmation: "123")}
    it "is valid when password is same as password_confirmation" do
      expect(subject.password).to eq(subject.password_confirmation)
    end
    it "is not valid when password is different as password_confirmation" do
      subject.password_confirmation = "1234"
      expect(subject.password).to_not eq(subject.password_confirmation)
    end
    it "is not valid without first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it "is not valid if password is less than 3 characters" do
      subject.password = "1"
      expect(subject).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    user = User.create(first_name: "Jim", last_name: "Bob", email: 'jim_bob@gmail.com', password: "123", password_confirmation: "123")
    it "is not valid if email and password do not match" do
      expect(User.authenticate_with_credentials(user[:email], "1234")).to be_nil
    end
    it "is valid if email is different case" do
      expect(User.authenticate_with_credentials("JiM_BOB@gmail.com", "123")).to_not be_nil
    end
    it "is valid if email has leading or trailing spaces" do
      expect(User.authenticate_with_credentials("   jim_bob@gmail.com  ", "123")).to_not be_nil
    end
  end
end
