class Task < ApplicationRecord
  belongs_to :category
  has_one :user, through: :category
  validates :date, presence: true

  scope :today, -> { where('date = ?', Date.current) }
  scope :delayed, -> { where('date < ?', Date.current) }
  scope :upcoming, -> { where('date > ?', Date.current) }
end
