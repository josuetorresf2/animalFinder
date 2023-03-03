FactoryBot.define do
    factory :user do
      email {"test@user.com"}
      password {"qwerty"}
      # Add additional fields as required via your User model
    end