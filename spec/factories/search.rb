FactoryBot.define do
  factory :search do
    id {1}
    query {"Where to buy a car?"}
    user_uuid {"123"}
    device {"Mobile"}
  end
end