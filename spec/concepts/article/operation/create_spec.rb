require 'rails_helper'

describe Article::Create do
  let!(:user) { create(:user) }
  let(:valid_params) do
    {
      title: 'タイトル',
      content: '本文'
    }
  end

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

    it 'should create a new article' do
      expect { run }.to change { Article.all.size }.from(0).to(1)
    end
  end

  context 'if params is invalid' do
    let(:invalid_params) { valid_params.merge(title: '') }
    let(:params) do
      ActionController::Parameters.new(invalid_params)
    end

    it 'should be failure' do
      expect(run).to be_failure
    end

    it 'should be invalid' do
      expect(run['validation.invalid']).to be_truthy
    end

    it 'should assign form object to form' do
      expect(run[:form]).to include(
        user_id: user.id,
        title: invalid_params[:title],
        content: invalid_params[:content],
        errors: {
          title: ["can't be blank"]
        }
      )
    end

    it 'should not create any articles' do
      expect { run }.not_to change { Article.all.size }
    end
  end
end
