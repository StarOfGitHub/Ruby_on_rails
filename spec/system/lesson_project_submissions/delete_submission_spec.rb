require 'rails_helper'

RSpec.describe 'Deleting a Project Submission' do
  let(:user) { create(:user) }
  let(:lesson) { create(:lesson, :project) }

  before do
    sign_in(user)
    visit lesson_path(lesson)
    Pages::ProjectSubmissions::Form.fill_in_and_submit
  end

  it 'successfully deletes a submission' do
    within(:test_id, 'submissions-list') do
      expect(page).to have_content(user.username)
    end

    find(:test_id, 'edit-submission-btn').click
    Pages::ProjectSubmissions::Form.new.delete

    within(:test_id, 'submissions-list') do
      expect(page).not_to have_content(user.username)
    end
  end
end
