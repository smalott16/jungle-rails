class User < ActiveRecord::Base
  
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password, length: { minimum: 4 }
  validates :password_confirmation, presence: true
  
  private

  def self.authenticate_with_credentials(email, password)
    # remove white space and set to all lower case
    normalized_email = email.strip.downcase
    # @user = User.find_by_email(normalized_email)
    @user = User.find_by('lower(email) =?', normalized_email)
    if @user && @user.authenticate(password)
      @user
    else 
      nil
    end
  end

end
