require 'rails_helper'

describe Article::Policy do
  describe 'author?' do
    let(:current_user) { create(:user) }
    let(:target_method) { :author? }

    context "when article's author is current_user" do
      let(:model) { create(:article, user: current_user) }

      it_should_be_authorized
    end

    context "when article's author is not current_user" do
      let(:model) { create(:article, :with_user) }

      it_should_not_be_uauthorized
    end
  end
end
