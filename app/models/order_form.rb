class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :order_id,
                :token

  with_options presence: true do
    validates :user_id, :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Input correctly.' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'phone number must be 10 to 11 digits long' }
    validates :city, :address, :token
  end

  def save
    order = Order.create(user_id:, item_id:)
    OrderInformation.create(postal_code:, prefecture_id:, city:, address:,
                            building_name:, phone_number:, order_id: order.id)
  end
end
