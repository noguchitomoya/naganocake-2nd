class Order < ApplicationRecord
    has_many :order_details
    belongs_to :end_user
    enum status:{
        waiting_for_payment:  0,
        payment_confirmation: 1,
        in_production:        2,
        preparing_to_ship:    3,
        shipped:              4
    }
    enum payment_method:{
        credit_card:          0,
        bank_transfer:        1
    }
end
