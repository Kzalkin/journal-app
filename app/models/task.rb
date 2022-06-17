class Task < ApplicationRecord
  belongs_to :category
  has_one :user, through: :category
  validates :date, presence: true
end
