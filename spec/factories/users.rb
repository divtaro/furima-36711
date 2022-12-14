FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    last_name             { '山田やまだヤマダ' }
    first_name            { '太郎たろうタロウ' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    date_birth            { Faker::Date.backward }
  end
end
