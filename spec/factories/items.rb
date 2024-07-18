FactoryBot.define do
  factory :item do
    item_name                      { Faker::Commerce.product_name }
    item_text                      { Faker::Lorem.sentence }
    image                          { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/hero.jpg')) }
    price                          { Faker::Number.between(from: 300, to: 9999999) }
    category_id                    { Faker::Number.between(from: 2, to: Category.all.length) }
    item_condition_id              { Faker::Number.between(from: 2, to: ItemCondition.all.length) }
    shipping_fee_responsibility_id { Faker::Number.between(from: 2, to: ShippingFeeResponsibility.all.length) }
    prefecture_id                  { Faker::Number.between(from: 2, to: Prefecture.all.length) }
    estimated_shipping_date_id     { Faker::Number.between(from: 2, to: EstimatedShippingDate.all.length) }
    association :user
  end
end
