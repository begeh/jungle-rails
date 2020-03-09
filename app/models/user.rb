class User < ActiveRecord::Base
  has_secure_password

  def self.authenticate_with_credentials(email,password)
    user = User.find_by_email(email.downcase.strip)
    if user
      if user.authenticate(password)
        user
      else
        nil
      end
    else
      nil
    end
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  validates :email, presence:true, uniqueness:true
end
