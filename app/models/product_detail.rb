class ProductDetail < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :name, presence: true,length: { minimum: 4}
    validates :category, presence: true,length: { minimum: 4}
    validates :price, presence: true,length: { minimum: 4}
end
