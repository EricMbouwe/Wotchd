class Group < ApplicationRecord
  has_many :programs
  has_one_attached :avatar

  validates :name, presence: true, uniqueness: true, length: { in: 3..10 }
  validate :acceptable_avatar

  scope :order_by_name, -> { order('name DESC') }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  def acceptable_avatar
    return errors.add(:avatar, 'is too big') unless avatar.byte_size <= 1.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    return errors.add(:avatar, 'must be a JPEG or PNG') unless acceptable_types.include?(avatar.content_type)
  end
end
