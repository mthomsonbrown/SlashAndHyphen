class User < ActiveRecord::Base
    validates :email, uniqueness: true
    validates :username, uniqueness: true, allow_blank: true
    
    has_many :beers
    
    before_create -> { self.auth_token = SecureRandom.hex }
end
