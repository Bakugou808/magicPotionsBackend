FactoryBot.define do
    totals_array = [49.99, 99.98, 149.97]
    exp_dates = ["04/20", "12/03", "09/16", "10/23"]
    quantities = [1,2,3]
    emails = ['asdf@gmail.com', 'casadojo819@gmail.com', 'lalapolaaza@yahoo.com']
    factory :order do
        email { emails.sample }
        quantity { quantities.sample }
        total { totals_array.sample }
        credit_card_number { Faker::Number.number(digits: 16) }
        credit_card_exp { exp_dates.sample }
    end
  end