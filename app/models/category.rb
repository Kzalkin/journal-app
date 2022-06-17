class Category < ApplicationRecord
    validates :title, presence: true, format: {without: /\s/, message: "must contain no spaces"}
    validates_uniqueness_of :title, scope: :user_id
    has_many :tasks, dependent: :destroy
    belongs_to :user
end
