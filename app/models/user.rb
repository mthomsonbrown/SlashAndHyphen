class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    validates :email, uniqueness: true
    validates :username, uniqueness: true, allow_blank: true
    validates :password, :confirmation => true
    validates :password_confirmation, :presence => true
    
    has_many :beers
    
    before_create -> { self.auth_token = SecureRandom.hex }
end
