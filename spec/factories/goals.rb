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

FactoryGirl.define do
  factory :goal do
    title { Faker::Book.title}
    visibility "Public"
    completeness "Incomplete"

    factory :private_goal do
      visibility "Private"
    end

    factory :complete_goal do
      completeness "Complete"
    end

    factory :private_complete_goal do
      visibility "Private"
      completeness "Complete"
    end
    
  end

end
