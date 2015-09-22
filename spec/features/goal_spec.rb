require 'spec_helper'
require 'rails_helper'

feature "goals" do

  scenario "user can create a new goal" do
    user = FactoryGirl::create(:user)
    goal = FactoryGirl::build(:goal)
    sign_in(user)
    visit user_url(user)
    create_goal(goal)
  end

  scenario "user can see their own goals" do
    user = FactoryGirl::create(:user)
    goal = FactoryGirl::build(:goal)
    sign_in(user)
    visit user_url(user)
    create_goal(goal)
    expect(page).to have_content(goal.title)
    expect(page).to have_content(goal.completeness)
  end

  scenario "user can not see other user's private goals" do
    user = FactoryGirl::create(:user)
    user2 = FactoryGirl::create(:user)
    private_goal = FactoryGirl::build(:private_goal)

    sign_in(user)
    visit user_url(user)
    create_goal(private_goal)
    click_button "Sign Out"

    sign_in(user2)
    visit user_url(user)
    expect(page).not_to have_content(private_goal.title)
    expect(page).not_to have_content(private_goal.completeness)
  end

  scenario "user can see other user's public goals" do
    user = FactoryGirl::create(:user)
    user2 = FactoryGirl::create(:user)
    goal = FactoryGirl::build(:goal)

    sign_in(user)
    visit user_url(user)
    create_goal(goal)
    click_button "Sign Out"

    sign_in(user2)
    visit user_url(user)
    expect(page).to have_content(goal.title)
    expect(page).to have_content(goal.completeness)
  end

  scenario "user can make an incomplete goal complete" do
    user = FactoryGirl::create(:user)
    goal = FactoryGirl::build(:goal)

    sign_in(user)
    visit user_url(user)
    create_goal(goal)
    click_button "Completed"
    expect(page).to have_content("Complete")
  end
end
