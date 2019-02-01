require 'rails_helper'
feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Hello"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'user[email]', :with => "testing@email.com"
      fill_in 'user[password]', :with => "biscuits"
      click_on "Sign Up"
    end

    scenario "redirects to bands index page after signup" do
      visit bands_url
    end
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'user[email]', :with => "testing@email.com"
      click_on "Sign Up"
    end

    scenario "re-renders the signup page after failed signup" do
      visit new_band_url
    end
  end

end