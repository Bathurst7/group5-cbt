class Customer < ApplicationRecord
    # Associations
    has_many :orders, dependent: :destroy
  
    # Validations
    validates :full_name, presence: true, length: { maximum: 100 }
    validates :phone_number, presence: true, format: { with: /\A[0-9]{10,15}\z/, message: "must be a valid phone number" }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :address, length: { maximum: 250 }, allow_blank: true
end