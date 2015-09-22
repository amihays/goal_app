require 'spec_helper'
require 'rails_helper'


feature "Comment" do
  given(:user) { FactoryGirl::create(:user) }
  given(:user2) { FactoryGirl::create(:user) }

  given(:goal) { FactoryGirl::build(:goal) }
  given(:comment_body) { Faker::Hacker.say_something_smart }
  before :each do
    sign_in(user)
  end

  scenario "user can post a comment on a goal" do

    visit user_url(user)
    create_goal(goal)
    click_link(goal.title)
    fill_in "Comment", with: comment_body
    click_button "Comment"

    expect(page).to have_content(comment_body)
    expect(page).to have_content("Comment by #{user.username}")
  end


  scenario "user can post a comment on another user" do
    click_button "Sign Out"
    sign_in(user2)
    click_link(user.username)
    fill_in "Comment", with: comment_body
    click_button "Comment"

    expect(page).to have_content(comment_body)
    expect(page).to have_content("Comment by #{user2.username}")
  end

  scenario "comment must have a body" do
    click_button "Sign Out"
    sign_in(user2)
    click_link(user.username)
    click_button "Comment"

    expect(page).to have_content("Body can't be blank")
  end

end
