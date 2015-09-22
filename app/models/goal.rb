# == Schema Information
#
# Table name: goals
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  user_id      :integer          not null
#  visibility   :string           not null
#  completeness :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Goal < ActiveRecord::Base
  Goal_Completeness = [
    "Complete",
    "Incomplete"
  ]
  Visibility = [
    "Public",
    "Private"
  ]
  validates :user_id, :title, :visibility, :completeness, presence: true
  validates :completeness, inclusion: Goal_Completeness
  validates :visibility, inclusion: Visibility
  after_initialize :set_to_incomplete!

  belongs_to(
    :user
  )

  has_many(
    :comments,
    as: :commentable,
    dependent: :destroy
  )

  def set_to_incomplete!
    self.completeness ||= "Incomplete"
  end

  def set_to_complete!
    self.completeness = "Complete"
  end

end
