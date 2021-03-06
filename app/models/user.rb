class User < ActiveRecord::Base
  has_many :messages

  has_secure_password

  before_validation :downcase_email

  validates :username, 
            presence: { :message => "Username is required!" }
            
  validates :username,
            uniqueness: { :message => "That username is aready being taken. " }
  
  validates_length_of :username, 
                      :minimum => 2,
                      :message => "Username must be at least two characters."

  validates :email, presence: true, uniqueness: true, format: { with: /@/ }
  validates :password, presence: true
  validates_length_of :password, :minimum => 8

  validates_format_of :email,
                      :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
                      :message => "Invalid Email"

  # User::Roles
  # The available roles
  Roles = [ :admin , :user ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end

  def admin?
    @user = User.find(params[:id])
    @user.role == 'Admin'
  end

  private

  def downcase_email
      self.email = email.to_s.downcase
  end
end
