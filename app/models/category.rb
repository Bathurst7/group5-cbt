class Category < ApplicationRecord
    # associations
    has_many :products, dependent: :destroy

    # validations
    validates :category_name, presence: true, uniqueness: true, length: { maximum: 100 }
end
