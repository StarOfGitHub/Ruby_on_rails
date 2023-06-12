require 'rails_helper'

RSpec.describe 'Selecting Paths' do
  let!(:default_path) { create(:path, title: 'Foundations', default_path: true) }
  let!(:rails_path) { create(:path, title: 'Rails') }
  let!(:user) { create(:user, path: default_path) }

  before do
    sign_in(user)
  end

  context 'when on the paths index page' do
    it 'allows a user to select a path' do
      visit paths_path

      expect(find(:test_id, 'foundations-resume-path-btn').text).to eq('Resume')
      expect(find(:test_id, 'rails-select-path-btn').text).to eq('Select')

      find(:test_id, 'rails-select-path-btn').click

      expect(find(:test_id, 'flash')).to have_text('You have selected the Rails path')
      expect(user.reload.path).to eq(rails_path)
    end
  end

  context 'when on the path show page' do
    it 'allows a user to select to that path' do
      visit path_path(rails_path)
      find(:test_id, 'rails-select-path-btn').click

      expect(find(:test_id, 'flash')).to have_text('You have selected the Rails path')
      expect(user.reload.path).to eq(rails_path)
    end
  end
end
