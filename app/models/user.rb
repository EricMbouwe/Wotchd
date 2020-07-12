class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { in: 3..10 }
  validates_presence_of :email
  validates_presence_of :password
  validates_uniqueness_of :email

  has_many :programs, inverse_of: 'author', dependent: :destroy
  has_many :full_programs, -> { includes :group }, class_name: 'Program'
end
