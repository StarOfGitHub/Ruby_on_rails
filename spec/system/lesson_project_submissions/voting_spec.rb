require 'rails_helper'

RSpec.describe 'Voting on Project Submissions' do
  let(:user) { create(:user) }
  let(:lesson) { create(:lesson, :project) }

  before do
    create(:project_submission, lesson:)

    sign_in(user)
    visit lesson_path(lesson)
  end

  it 'a user can vote on another users submission' do
    within(:test_project_submission, 1) do
      expect(find(:test_id, 'number-of-likes')).to have_content('0')
      find(:test_id, 'like-btn').click
      expect(find(:test_id, 'number-of-likes')).to have_content('1')
    end
  end

  it 'a user can remove their vote' do
    within(:test_project_submission, 1) do
      find(:test_id, 'like-btn').click
      expect(find(:test_id, 'number-of-likes')).to have_content('1')
      find(:test_id, 'like-btn').click
      expect(find(:test_id, 'number-of-likes')).to have_content('0')
    end
  end

  it 'a user can vote on their own submission' do
    Pages::ProjectSubmissions::Form.fill_in_and_submit
    users_submission = first(:test_id, 'submission-item')

    within(users_submission) do
      expect(page).to have_content(user.username)
      expect(find(:test_id, 'number-of-likes')).to have_content('0')
      find(:test_id, 'like-btn').click
      expect(find(:test_id, 'number-of-likes')).to have_content('1')
    end
  end
end
