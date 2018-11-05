require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user) }

  before { allow(controller).to receive(:current_user) { user } }

  describe '#show' do
    before { get :show, params: { id: user.id } }

    it 'should return status 200' do
      expect(response.code).to eq '200'
    end
  end
end
