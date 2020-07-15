class Program < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :group, foreign_key: 'group_id', optional: true

  validates :name, presence: true, length: { in: 3..30 }
  validates :amount, presence: true, numericality: { only_integer: true }

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :no_group, -> { where group_id: nil }
  scope :grouped, -> { where.not(group_id: nil) }
  scope :daily, -> { where(created_at: Time.now.beginning_of_day..Time.zone.now) }
  scope :weekly, -> { where(created_at: Time.now.prev_day(days = 7)..Time.zone.now) }
  scope :monthly, -> { where(created_at: Time.now.prev_month(months = 1)..Time.zone.now) }
  scope :yearly, -> { where(created_at: Time.now.prev_year(years = 1)..Time.zone.now) }

  def self.total_hours
    sum(:amount)
  end
end
