class UserComment < ActiveRecord::Base
  validates :body, :poster_id, :user_id, presence: true

  belongs_to :poster,
    class_name: :User

  belongs_to :user
end
