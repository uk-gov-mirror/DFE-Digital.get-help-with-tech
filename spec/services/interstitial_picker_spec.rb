require 'rails_helper'

RSpec.describe InterstitialPicker, type: :model do
  describe 'calling interstitial picker for la funded place' do
    let(:school) { create :la_funded_place }
    let(:user) { create :user, schools: [school] }
    let (:service) { described_class.new(user: user) }

    context 'when a standard device allocation does not exist' do
      it 'creates a new device allocation record' do
        expect(service.call.partial).to eq ('interstitials/la_funded_user')
      end
    end
  end
end
