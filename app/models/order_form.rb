class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token

  validates :user_id, :item_id, :token, presence: true
  
  def save
    Order.create(user_id: user_id, item_id: item_id, token: token)
  end
end

