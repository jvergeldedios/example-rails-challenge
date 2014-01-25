class Charge < ActiveRecord::Base
  module Currency
    USD = 'usd'
    EUR = 'eur'
  end

  CURRENCIES = [Currency::USD, Currency::EUR]

  validates_presence_of :amount
  validates_presence_of :currency
  validates_inclusion_of :currency, in: CURRENCIES

  belongs_to :customer

  scope :optimized, -> { includes(:user) }
  scope :successful, -> { where(failed_on: nil, disputed_on: nil) }
  scope :failed, -> { where('failed_on IS NOT NULL') }
  scope :disputed, -> { where('disputed_on IS NOT NULL') }

end