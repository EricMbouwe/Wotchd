class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, length: { minimum: 6 }
  validates_presence_of :email
  validates_presence_of :password
  validates_uniqueness_of :email

  
end
