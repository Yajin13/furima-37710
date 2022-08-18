class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, number: number, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end

end