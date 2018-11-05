FactoryBot.define do
  factory :article do
    sequence :title do |n|
      "title #{n}"
    end
    sequence :content do |n|
      "content #{n}"
    end

    trait :with_user do
      after(:build) do |article|
        article.user = build(:user)
      end
    end
  end
end
