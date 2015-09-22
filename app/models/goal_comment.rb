class GoalComment < ActiveRecord::Base
  validates :body, :poster_id, :goal_id, presence: true

  belongs_to :poster,
    class_name: :User

  belongs_to :goal
end
