class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day

  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true, length: { maximum: 40 }
  validates :item_explain, presence: true, length: { maximum: 1000 }

  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
  
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }
end
