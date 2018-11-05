require 'rails_helper'

describe Article::Contract::Create do
  let(:user) { create(:user) }

  let(:contract_class) { described_class }
  let(:model_class) { Article }
  let(:valid_params) do
    {
      user_id: user.id,
      title: 'タイトル',
      content: '本文'
    }
  end

  context 'If all properties are valid' do
    it_should_not_have_validation_error
  end

  describe 'Invalid property' do
    describe 'user_id validation' do
      context 'if user_id is not numeric' do
        let(:target_property)    { :user_id }
        let(:target_value)       { 'a' }
        let(:error_message_args) { ['is invalid'] }

        it_should_have_validation_error
      end

      context 'if user is not exists' do
        let(:target_property)    { :user_id }
        let(:target_value)       { user.id + 1 }
        let(:error_message_args) { ['is invalid'] }

        it_should_have_validation_error
      end
    end

    describe 'title validation' do
      context 'if title is empty' do
        let(:target_property)    { :title }
        let(:target_value)       { '' }
        let(:error_message_args) { ["can't be blank"] }

        it_should_have_validation_error
      end

      context 'if title is too long' do
        let(:target_property)    { :title }
        let(:target_value)       { 'a' * 201 }
        let(:error_message_args) { ['is too long (maximum is 200 characters)'] }

        it_should_have_validation_error
      end

      context 'if title includes NG word' do
        let(:target_property)    { :title }
        let(:target_value)       { 'うわ落ちた' }
        let(:error_message_args) { ['is invalid'] }

        it_should_have_validation_error
      end
    end

    describe 'content validation' do
      context 'if content is empty' do
        let(:target_property)    { :content }
        let(:target_value)       { '' }
        let(:error_message_args) { ["can't be blank"] }

        it_should_have_validation_error
      end

      context 'if content is too long' do
        let(:target_property)    { :content }
        let(:target_value)       { 'a' * 1001 }
        let(:error_message_args) { ['is too long (maximum is 1000 characters)'] }

        it_should_have_validation_error
      end
    end
  end
end
