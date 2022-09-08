class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :municipality, :block_number, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token

    # 数字3桁、ハイフン、数字4桁の並びのみ許可する
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipality
    validates :block_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :user_id
    validates :item_id
  end
  
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, block_number: block_number, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end