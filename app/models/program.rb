class Program < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category, class_name: 'Group', foreign_key: 'group_id', optional: true

  validates :name, presence: true, length: { in: 3..15 }
  validates :amount, presence: true, numericality: { only_integer: true }

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :no_group, -> { where("group_id = nil") }

  # def self.total_hours
  #   self.count_by_sql(“SELECT SUM(amount) FROM programs”)
  #   self.find_by_sql(“SELECT SUM(amount) FROM programs”) 
  # end
end
