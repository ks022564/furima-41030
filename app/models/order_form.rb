class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :order_id 

  with_options presence: true do
    validates :user_id, :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Input correctly.' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, :address, :building_name, :phone_number
  end
  


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    OrderInformation.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end

