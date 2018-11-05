require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let!(:user) { create(:user) }

  before { allow(controller).to receive(:current_user) { user } }

  describe '#index' do
    let!(:article) { create(:article, user: user) }

    before { get :index }

    it 'should return status 200' do
      expect(response.code).to eq '200'
    end
  end

  describe '#show' do
    let!(:article) { create(:article, user: user) }

    before { get :show, params: { id: article.id } }

    it 'should return status 200' do
      expect(response.code).to eq '200'
    end
  end

  describe '#new' do
    before { get :new }

    it 'should return status 200' do
      expect(response.code).to eq '200'
    end
  end

  describe '#create' do
    let(:params) do
      {
        title: 'edited タイトル',
        content: 'edited 本文',
        is_pickup: true
      }
    end

    before { post :create, params: params }

    it 'redirects to created article page' do
      expect(response).to redirect_to article_path(Article.last)
    end
  end

  describe '#edit' do
    let!(:article) { create(:article, user: user) }

    before { get :edit, params: { id: article.id } }

    it 'should return status 200' do
      expect(response.code).to eq '200'
    end
  end

  describe '#update' do
    let!(:article) { create(:article, user: user) }

    let(:params) do
      {
        id: article.id,
        title: 'edited タイトル',
        content: 'edited 本文',
        is_pickup: true
      }
    end

    before { put :update, params: params }

    it 'redirects to updated article page' do
      expect(response).to redirect_to article_path(article)
    end
  end
end
