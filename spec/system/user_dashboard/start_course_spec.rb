require 'rails_helper'

RSpec.describe 'Starting Course from User Dashboard' do
  let!(:default_path) { create(:path, default_path: true) }
  let!(:foundations_course) { create(:course, title: 'Foundations', path: default_path) }
  let!(:user) { create(:user) }

  context 'when new user starts default path' do
    before do
      create(:lesson, course: foundations_course)

      sign_in(user)
      visit dashboard_path
    end

    it 'has button to start new course' do
      expect(find(:test_id, 'foundations-start-btn')).to have_text('Start')
    end

    it 'successfully starts new course' do
      find(:test_id, 'foundations-start-btn').click

      expect(page).to have_current_path(path_course_path(default_path, foundations_course))
    end
  end

  context 'when user selected a new path' do
    let!(:rails_path) { create(:path, title: 'Rails') }
    let!(:ruby_course) { create(:course, title: 'Ruby', path: rails_path) }

    before do
      create(:lesson, course: ruby_course)

      sign_in(user)
      visit paths_path
      find(:test_id, 'rails-select-path-btn').click
      visit dashboard_path
    end

    it 'has button to start new course' do
      expect(find(:test_id, 'ruby-start-btn')).to have_text('Start')
    end

    it 'successfully starts new course' do
      find(:test_id, 'ruby-start-btn').click

      expect(page).to have_current_path(path_course_path(rails_path, ruby_course))
    end
  end
end
