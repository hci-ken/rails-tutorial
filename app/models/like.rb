class Like < ApplicationRecord
    belongs_to :user
    belongs_to :skill
    counter_culture :skill
    validates :user_id, presence: true
    validates :skill_id, presence: true
end
