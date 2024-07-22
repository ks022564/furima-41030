FactoryBot.define do
  factory :order_form do
    postal_code           { '123-4567'}
    prefecture_id         { Faker::Number.between(from: 2, to: Prefecture.all.length) }
    city                  {'足立区'} 
    address               {'1-1'}
    building_name         {'東京ハイツ'}
    phone_number          {'09012345678'}
    token                 {'pk_test_f10295d57700e030152497b1'}
    price                 {'3000'}
  end
end
