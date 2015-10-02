class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  
  has_many :beers
  
  def say_hello
    "Hello #{object.email}!"
  end
end
