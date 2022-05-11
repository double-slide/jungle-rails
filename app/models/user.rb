class User < ApplicationRecord

  has_secure_password
  
  validates :name, :email, :password, :password_confirmation,  presence: true
  validates :password, :length => { :minimum => 8 }
  validates :email, uniqueness: true
  validates :email, :uniqueness => { :case_sensitive => false }

  def self.authenticate_with_credentials(email, password)
    @email = email.downcase.strip
    @user = User.find_by_email(@email)
    if (@user && @user.authenticate(password))
      @user
    else
      nil
    end
  end

end
