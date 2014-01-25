class Seed
  def self.perform

    customer_1 = Customer.create first_name: 'Johny', last_name: 'Flow'
    customer_2 = Customer.create first_name: 'Raj', last_name: 'Jamnis'
    customer_3 = Customer.create first_name: 'Andrew', last_name: 'Chung'
    customer_4 = Customer.create first_name: 'Mike', last_name: 'Smith'

    # Successful charges
    5.times { Charge.create amount: 4900, currency: Charge::Currency::USD, paid: true, refunded: false, customer: customer_1 }
    3.times { Charge.create amount: 4900, currency: Charge::Currency::USD, paid: true, refunded: false, customer: customer_2 }

    Charge.create amount: 4900, currency: Charge::Currency::USD, paid: true, refunded: false, customer: customer_3
    Charge.create amount: 4900, currency: Charge::Currency::USD, paid: true, refunded: false, customer: customer_4

    # Failed charges
    3.times { Charge.create amount: 4900, currency: Charge::Currency::USD, paid: true, refunded: false, failed_on: Time.now, customer: customer_3 }
    2.times { Charge.create amount: 4900, currency: Charge::Currency::USD, paid: true, refunded: false, failed_on: Time.now, customer: customer_4 }

    # Disputed charges
    3.times { Charge.create amount: 4900, currency: Charge::Currency::USD, paid: true, refunded: false, disputed_on: Time.now, customer: customer_1 }
    2.times { Charge.create amount: 4900, currency: Charge::Currency::USD, paid: true, refunded: false, disputed_on: Time.now, customer: customer_2 }
  end
end