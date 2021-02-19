FactoryBot.define do
  factory :nurse do
    name                   {Faker::Name}
    mployee_number         {'00000000'}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmaition {password}
  end
end