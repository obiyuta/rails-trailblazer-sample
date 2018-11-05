require 'rails_helper'

describe User::Representer::Show do
  let(:model) { create(:user) }
  let(:represented) { described_class.new(model) }

  describe 'Properties' do
    let(:options) { { user_options: {} } }
    let(:rendered) { represented.to_hash(options) }

    describe 'id' do
      it 'should return id' do
        expect(rendered['id']).to eq model.id
      end
    end

    describe 'email' do
      it 'should not return email' do
        expect(rendered['email']).to eq nil
      end
    end

    describe 'name' do
      it 'should return name' do
        expect(rendered['name']).to eq model.name
      end
    end

    describe 'updated_at' do
      it 'should return updated_at with YYYY-MM-DD HH:MM format' do
        expected = model.updated_at.strftime('%Y-%m-%d %H:%M')
        expect(rendered['updated_at']).to eq expected
      end
    end

    describe 'created_at' do
      it 'should return updated_at with YYYY-MM-DD format' do
        expected = model.created_at.strftime('%Y-%m-%d')
        expect(rendered['created_at']).to eq expected
      end
    end
  end

  describe 'Methods' do
    describe '#created_at' do
      it 'should return created_at with YYYY-MM-DD format' do
        expected = model.created_at.strftime('%Y-%m-%d')
        expect(represented.created_at).to eq expected
      end
    end
  end
end
