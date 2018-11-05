require 'rails_helper'

describe User::Show do
  describe 'Operation' do
    let(:user) { create(:user) }

    def run
      described_class.call(params: params, current_user: user)
    end

    context 'if completes steps' do
      let(:params) { ActionController::Parameters.new(id: user.id) }

      it 'should be success' do
        expect(run).to be_success
      end

      it 'should assign user to model' do
        expect(run[:model]).to eq User::Representer::Show.new(user).to_hash
      end
    end

    context 'if the user does not exist' do
      let(:params) { ActionController::Parameters.new(id: user.id + 1) }

      it 'should raise error' do
        expect { run }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
