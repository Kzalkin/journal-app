class Category < ApplicationRecord
    validates :title, presence: true, format: {without: /\s/}
    validates_uniqueness_of :title, scope: :user_id
    has_many :tasks
    belongs_to :user
end
