
require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit '/users/new'
    expect(current_path).to eq(new_user_path)
  end

  scenario "has a Username/Password fields" do
    visit '/users/new'
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
  end


  feature "signing up a user" do
    scenario "shows username on the homepage after signup" do
      user = FactoryGirl::build(:user)
      visit '/users/new'
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_button "Sign Up"

      expect(current_path).to eq(root_path)
      expect(page).to have_content(user.username)
    end

    scenario "shows errors with no username/password" do
      visit '/users/new'
      click_button "Sign Up"

      expect(page).to have_content("Username can't be blank")
      expect(page).to have_content("Password is too short (minimum is 6 characters)")
    end
  end
end

feature "logging in" do
  scenario "shows username on the homepage after login" do
    user = FactoryGirl::create(:user)
    visit '/session/new'
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"

    expect(page).to have_content(user.username)
  end
end

feature "logging out" do
  scenario "begins with logged out state" do
    visit root_path
    expect(page).not_to have_content("Sign Out")
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Sign Up")
  end

  scenario "doesn't show username on the homepage after logout" do
    user = FactoryGirl::create(:user)
    visit '/session/new'
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"
    click_on "Sign Out"
    expect(page).not_to have_content(user.username)
  end
end
