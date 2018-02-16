class Skill < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :plus_users, through: :likes,source: :user
  #default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true

  def plus(user)
    likes.create(user_id: user.id)
  end

  def plus?(user)
    plus_users.include?(user)
  end

  def minus(user)
    likes.find_by(user_id: user.id).destroy
  end
end
