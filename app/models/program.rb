class Program < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category, class_name: 'Group', foreign_key: 'group_id', optional: true

  validates :name, presence: true, length: { in: 3..15 }
  validates :amount, presence: true, numericality: { only_integer: true }
end
