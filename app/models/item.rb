class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_category
  belongs_to :shipping_fee_responsibility
  belongs_to :prefecture
  belongs_to :estimated_shipping_date


  has_one_attached :image



  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_responsibility_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :estimated_shipping_date_id, numericality: { other_than: 1, message: "can't be blank" }




end
