class Group < ApplicationRecord
  has_many :programs
  has_one_attached :avatar

  validates :name, presence: true, uniqueness: true, length: { in: 3..10 }
  # validates :avatar, presence: true

  scope :order_by_name, -> { order('name DESC') }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
