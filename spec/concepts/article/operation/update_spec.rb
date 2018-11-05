require 'rails_helper'

describe Article::Update do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, user: user) }
  let(:valid_params) do
    {
      id: article.id,
      title: 'edited タイトル',
      content: 'edited 本文',
      is_pickup: true
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

    it 'should update the article' do
      run
      expect(article.reload).to have_attributes(
        title: valid_params[:title],
        content: valid_params[:content],
        is_pickup: valid_params[:is_pickup]
      )
    end

    it 'should not create a new article' do
      expect { run }.not_to change { Article.all.size }
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
        is_pickup: invalid_params[:is_pickup],
        errors: {
          title: ["can't be blank"]
        }
      )
    end

    it 'should not create any articles' do
      expect { run }.not_to change { Article.all.size }
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
