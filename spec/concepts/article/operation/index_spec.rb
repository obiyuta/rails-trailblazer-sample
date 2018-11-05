require 'rails_helper'

describe Article::Index do
  describe 'Operation' do
    let(:articles) { create_list(:article, 5, :with_user) }

    def run
      described_class.call(params: params, current_user: nil)
    end

    context 'if completes steps' do
      let(:params) { {} }

      it 'should be success' do
        expect(run).to be_success
      end

      it 'should assign article to model' do
        expected = Article::Representer::Index.new(articles).to_hash
        expect(run[:model]).to eq expected
      end
    end
  end
end
