require 'rails_helper'

describe Article::New do
  let!(:user) { create(:user) }

  def run
    described_class.call(params: params, current_user: user)
  end

  context 'if completes steps' do
    let(:params) { {} }

    it 'should be success' do
      expect(run).to be_success
    end

    it 'should assign form object to form' do
      expect(run[:form]).to include(
        user_id: nil,
        title: nil,
        content: nil,
        errors: {}
      )
    end

    it 'should assign model instance to mode' do
      expect(run[:model]).to have_attributes(
        user_id: nil,
        title: nil,
        content: nil
      )
    end
  end
end
