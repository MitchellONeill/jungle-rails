class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false }

  validates :password,
    :presence => { :on => :create },
    length: { minimum: 2 },
    confirmation: true

def self.authenticate_with_credentials(email, password)
  formatted_email = email.downcase.strip
  user = User.find_by(email: formatted_email)
   if user && user.authenticate(password)
      user
    else
      false
  end


end

end
