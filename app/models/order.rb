class Order < ApplicationRecord
     # validations for Order attributes ++ valid_email_2 gem for additional mx verification
     validates :email, 'valid_email_2/email': {mx: true, message: "Not A Valid Email"}
     validates :email, uniqueness: {case_sensitive: true, message: "Order Already Exists"}
     validates_presence_of :email, :quantity, :total, :credit_card_exp, :credit_card_number
     validates :quantity, numericality: { only_integer: true, less_than_or_equal_to: 3, message: "Invalid Order Quantity (orders must be within 1-3 potions)" }
     validates :credit_card_exp, format: {with: /\b(0[1-9]|1[0-2])\/?([0-9]{4}|[0-9]{2})\b/, message: "Exp Date Is Invalid"}
     validates :credit_card_number, length: { is: 16, message: "Invalid Credit Card Number (must be at least 16 characters)" }
     validates :total, numericality: {message: "Total Is Not A Valid Number"}
     validates :credit_card_number, numericality: {only_integer: true, message: "Credit Card Number Must Be Only Integers (No Alphabetical Characters)"}
end
