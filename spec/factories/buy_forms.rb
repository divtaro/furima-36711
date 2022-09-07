FactoryBot.define do
  factory :buy_form do
    user_id         { '1' }
    item_id         { '1' }
    post_code       { '123-4567' }
    prefecture_id   { '2' }
    municipalities  { '名古屋市' }
    house_num       { '1-1-1' }
    building        { '' }
    tel             { '09012345678' }
    token           { 'tok_abcdefghijk00000000000000000' }
  end
end
