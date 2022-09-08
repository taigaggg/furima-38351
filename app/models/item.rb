class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :send_date

  validates :image, presence: true
  validates :item_name, presence: true, length: { maximum:40 }
  validates :explanation, presence: true, length: { maximum:1000 }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  validates :category_id, numericality: { other_than:1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than:1, message: "can't be blank" }
  validates :postage_id, numericality: { other_than:1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than:1, message: "can't be blank" }
  validates :send_date_id, numericality: { other_than:1, message: "can't be blank" }

end
