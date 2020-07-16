require 'rails_helper'

feature 'features', type: :feature do
  scenario 'has a new user page' do
    visit new_user_path
    expect(page).to have_content 'Register'
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_path
      fill_in 'user_name', with: 'dann'
      fill_in 'user_email', with: 'dan@server.io'
      fill_in 'user_password', with: 'abcd'
      click_on 'Sign Up'
    end

    scenario 'redirects to user profile page after signup' do
      expect(page).to have_content 'All my programs'
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content 'Dann'
    end
  end
end
