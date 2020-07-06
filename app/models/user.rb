class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email

  def logged_in?
    @current_user ? true : false
  end
end
