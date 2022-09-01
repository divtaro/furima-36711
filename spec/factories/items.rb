FactoryBot.define do
  factory :item do
    item_name           {Faker::Lorem.characters(number: 40)}
    description         {Faker::Lorem.characters(number: 1000)}
    category_id         {Faker::Number.between(from: 2, to: 11)}
    status_id           {Faker::Number.between(from: 2, to: 7)}
    delivery_charge_id  {Faker::Number.between(from: 2, to: 3)}
    prefecture_id       {Faker::Number.between(from: 2, to: 48)}
    days_ship_id        {Faker::Number.between(from: 2, to: 4)}
    price               {Faker::Number.between(from: 300, to: 9999999)}
    association :user
  end

  factory :image do
    image               {Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/furima-intro01.png'), 'image/png')}
  end  
end