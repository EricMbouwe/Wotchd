class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { in: 3..10 }
  validates_presence_of :email
  validates_presence_of :password
  validates_uniqueness_of :email
  validate :acceptable_avatar

  has_one_attached :avatar
  has_many :programs, inverse_of: 'author', dependent: :destroy
  has_many :programs, -> { includes :group }, class_name: 'Program'

  def acceptable_avatar
    return errors.add(:avatar, 'is too big') unless avatar.byte_size <= 1.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    return errors.add(:avatar, 'must be a JPEG or PNG') unless acceptable_types.include?(avatar.content_type)
  end
end
