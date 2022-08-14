class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true
  validates :string, :text, :integer, presence: true

  validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank" }
end
