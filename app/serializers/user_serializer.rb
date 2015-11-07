class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username
  
  has_many :beers
  
end
