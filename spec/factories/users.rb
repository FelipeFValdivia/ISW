FactoryGirl.define do
  factory :user do
    # name
    sequence :name do |n|
      "User #{n}"
    end
    # email
    sequence :email do |n|
      "user#{n}@example.com"
    end
    # password
    password_digest "password"

    trait :request_user do
      password "password"
    end

    # auths
    authentication_token { SecureRandom.hex(20).encode('UTF-8') }
    authentication_token_expires_at { 30.days.from_now }

    # permissions
    permission_level -1
    trait :admin_user do
      permission_level 1
    end
    trait :common_user do
      permission_level 0
    end
    trait :viewer_user do
      permission_level -1
    end
  end
end
