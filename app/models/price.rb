class Price < ApplicationRecord
  validates :currency_code, presence: true
end
