require 'rails_helper'

describe Article::Edit do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, user: user) }
  let(:valid_params) { { id: article.id } }

  def run
    described_class.call(params: params, current_user: user)
  end

  context 'if completes steps' do
    let(:params) do
      ActionController::Parameters.new(valid_params)
    end

    it 'should be success' do
      expect(run).to be_success
    end

    it 'should assign form object to form' do
      expect(run[:form]).to include(
        user_id: article.user_id,
        title: article.title,
        content: article.content,
        errors: {}
      )
    end

    it 'should assign represented article to model' do
      expect(run[:model]).to eq Article::Representer::Show.new(article).to_hash
    end
  end

  context 'if user is not author' do
    let(:invalid_user) { create(:user) }
    let(:params) do
      ActionController::Parameters.new(valid_params)
    end

    it 'should raise exception' do
      expect do
        described_class.call(params: params, current_user: invalid_user)
      end.to raise_error(StandardError)
    end
  end
end
