class Group < ApplicationRecord
  has_many :programs

  validates :name, presence: true, uniqueness: true, length: { in: 3..15 }

  
  scope :order_by_name, -> { order('name DESC') }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
