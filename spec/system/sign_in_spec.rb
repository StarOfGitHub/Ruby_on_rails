require 'rails_helper'

RSpec.describe 'Sign in' do
  let!(:user) { create(:user, email: 'odinstudent@example.com') }

  context 'when using an email and password' do
    context 'with valid credentials' do
      it 'allows the user to sign in' do
        visit root_path

        find(:test_id, 'nav-sign-in').click

        find(:test_id, 'email-field').fill_in with: user.email
        find(:test_id, 'password-field').fill_in with: user.password

        find(:test_id, 'submit-btn').click

        expect(page).to have_current_path(dashboard_path)
      end
    end

    context 'with an invalid email format' do
      it 'notifies the user that the email is not valid' do
        visit root_path

        find(:test_id, 'nav-sign-in').click

        find(:test_id, 'email-field').fill_in with: 'aaaaaaa'
        find(:test_id, 'password-field').fill_in with: user.password

        expect(page).to have_content('is not a valid email')
      end

      it 'removes the message once a user fixes their email address' do
        visit root_path

        find(:test_id, 'nav-sign-in').click

        find(:test_id, 'email-field').fill_in with: 'aaaaa'
        expect(page).to have_content('is not a valid email')

        find(:test_id, 'email-field').fill_in with: user.email
        find(:test_id, 'password-field').click
        expect(page).not_to have_content('is not a valid email')
      end
    end

    context 'with a password less than 6 characters' do
      it 'notifies the user that the password is not valid' do
        visit root_path

        find(:test_id, 'nav-sign-in').click

        find(:test_id, 'email-field').fill_in with: user.email
        find(:test_id, 'password-field').fill_in with: 'aaa'

        expect(page).to have_content('is too short (minimum is 6 characters)')
      end
    end
  end

  context 'when signing in with github auth' do
    before do
      mock_oauth_provider(:github)
    end

    after do
      OmniAuth.config.mock_auth[:github] = nil
    end

    it 'signs in the user' do
      visit root_path

      find(:test_id, 'nav-sign-in').click

      find(:test_id, 'github-btn').click

      expect(page).to have_current_path(dashboard_path)
    end
  end

  context 'when signing in with google auth' do
    before do
      mock_oauth_provider(:google)
    end

    after do
      OmniAuth.config.mock_auth[:google] = nil
    end

    it 'signs in the user' do
      visit root_path

      find(:test_id, 'nav-sign-in').click

      find(:test_id, 'google-btn').click

      expect(page).to have_current_path(dashboard_path)
    end
  end
end
