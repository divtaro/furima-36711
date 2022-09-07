FactoryBot.define do
  factory :buy_form do

  # 外部キーカラムの直接入力は推奨されないため、③テストコードのbeforeブロック内に記述する

    ## ①任意の数字を入れた状態
      # user_id         { '1' }
      # item_id         { '1' }

    ## ②Fakerでランダムな数字を生成する
      # user_id         { Faker::Number.non_zero_digit }
      # item_id         { Faker::Number.non_zero_digit }
  
    post_code       { '123-4567' }
    prefecture_id   { '2' }
    municipalities  { '名古屋市' }
    house_num       { '1-1-1' }
    building        { '' }
    tel             { '09012345678' }
    token           { 'tok_abcdefghijk00000000000000000' }
  end
end
