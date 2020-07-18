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
      expect(page).to have_content 'All Groups'
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content 'Dann'
    end
  end

  feature 'create a new program' do
    before(:each) do
      User.create(name: 'damien', email: 'dal@server.com', password: 'abcdef')
      visit new_session_path
      fill_in 'name', with: 'damien'
      click_on 'Login'
    end

    scenario 'with invalid params' do
      visit new_program_path
      fill_in 'program_name', with: 'dbz'
      click_on 'Add a program'
      expect(page).to have_content "Amount can't be blank"
    end

    scenario 'with valid params' do
      visit new_program_path
      fill_in 'program_name', with: 'good doctor'
      fill_in 'program_amount', with: 54
      click_on 'Add a program'
      expect(page).to have_content 'Good doctor'
    end
  end

  feature 'create a new group' do
    before(:each) do
      User.create(name: 'damien', email: 'dal@server.com', password: 'abcdef')
      visit new_session_path
      fill_in 'name', with: 'damien'
      click_on 'Login'
    end

    scenario 'with invalid params' do
      visit new_group_path
      click_on 'Create Group'
      expect(page).to have_content "Name can't be blank"
    end
  end

  feature 'renders the list of TV shows' do
    before(:each) do
      User.create(name: 'damien', email: 'dal@server.com', password: 'abcdef')
      visit new_session_path
      fill_in 'name', with: 'damien'
      click_on 'Login'
    end

    scenario 'All TV shows' do
      visit user_path(User.find_by(name: 'damien').id)
      click_on 'All my TV Shows'
      expect(page).to have_content 'My TV Shows'
    end

    scenario 'All shuffled TV shows' do
      visit programs_path('ungrouped')
      expect(page).to have_content 'My Shuffled TV Shows'
    end
  end
end
