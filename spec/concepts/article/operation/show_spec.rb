require 'rails_helper'

describe Article::Show do
  describe 'Operation' do
    let(:article) { create(:article, :with_user) }

    def run
      described_class.call(params: params, current_user: nil)
    end

    context 'if completes steps' do
      let(:params) { ActionController::Parameters.new(id: article.id) }

      it 'should be success' do
        expect(run).to be_success
      end

      it 'should assign article to model' do
        expect(run[:model]).to eq Article::Representer::Show.new(article).to_hash
      end
    end

    context 'if the article does not exist' do
      let(:params) { ActionController::Parameters.new(id: article.id + 1) }

      it 'should raise error' do
        expect { run }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
