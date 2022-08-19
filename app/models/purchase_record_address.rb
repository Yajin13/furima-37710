class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :city
    validates :house_number
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  validates :phone_number, presence: true
  validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is out of setting range" }

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end

end