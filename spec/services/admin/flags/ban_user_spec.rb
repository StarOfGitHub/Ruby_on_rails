require 'rails_helper'

RSpec.describe Admin::Flags::BanUser do
  subject(:service) { described_class.call(admin:, flag:) }

  let(:admin) { create(:user, admin: true) }
  let(:flag) { create(:flag, project_submission:) }
  let(:project_submission) { create(:project_submission, user:) }
  let(:user) { create(:user) }

  describe '#call' do
    it 'sets the flagged project submission to banned' do
      expect { service }.to change { project_submission.reload.discarded_at }.from(nil)
    end

    it 'sets the flagged project submissions owner to banned' do
      expect { service }.to change { user.banned }.from(false).to(true)
    end

    it 'sets the flags taken action to ban' do
      expect { service }.to change { flag.taken_action }.from('pending').to('ban')
    end

    it 'sets the flags status to resolved' do
      expect { service }.to change { flag.status }.from('active').to('resolved')
    end

    it 'sets the resolved_by_id to the id of the current admin user' do
      expect { service }.to change { flag.resolved_by_id }.from(nil).to(admin.id)
    end
  end

  describe '#success?' do
    it 'returns true' do
      expect(service.success?).to be(true)
    end
  end
end
