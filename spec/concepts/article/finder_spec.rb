require 'rails_helper'

describe Article::Finder do
  describe 'Filter' do
    describe 'pickup filter' do
      before do
        create_list(:article, 3, :with_user, is_pickup: true)
        create_list(:article, 3, :with_user, is_pickup: false)
      end

      context 'if  contain the value' do
        let(:params) { { is_pickup: true } }
        let(:filter) { described_class.new(filter: params) }

        it 'should return match record' do
          expect(filter.results.pluck(:is_pickup).uniq).to eq [true]
        end
      end
    end
  end

  describe 'Pageing' do
    describe 'per_page' do
      context 'if per_page is not given' do
        let(:finder) { described_class.new }

        it 'returns 10 users per page by default' do
          expect(finder.per_page).to eq 10
        end
      end

      context 'if per_page is given' do
        let(:per_page) { 5 }
        let(:finder) { described_class.new(per_page: per_page) }

        it 'returns specify number of items per page' do
          expect(finder.per_page).to eq per_page
        end
      end
    end

    describe 'page' do
      before do
        create_list(:article, 21, :with_user)
      end

      context 'if page is not given' do
        let(:finder) { described_class.new }

        it 'returns fist page by default' do
          expect(finder.results).to match_array Article.limit(10)
        end
      end

      context 'if page is given' do
        let(:page) { 2 }
        let(:finder) { described_class.new(page: page) }

        it 'returns items of specify page' do
          expect(finder.results).to match_array Article.limit(10).offset(10)
        end
      end
    end
  end
end
