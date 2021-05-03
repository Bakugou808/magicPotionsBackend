require 'rails_helper'

describe Order, :type => :model do 

    before(:all) do 
        @order1 = create(:order)
    end
    
# checks to see if all fields are valid
    it 'it has valid fields' do
        expect(@order1).to be_valid
    end

    it "it must have a valid email" do
        order2 = build(:order, email: "bobgmail.com")
        expect(order2).to_not be_valid
    end
    
    it "it must have a unique email" do
        order2 = build(:order, email: @order1.email)
        expect(order2).to_not be_valid
    end
    
    it "is not valid if order is outside of 1-3 units" do 
    order2 = build(:order, quantity: 5)
    expect(order2).to_not be_valid
    end
    
    it "is not valid without a 16 digit CC number" do 
    order2 = build(:order, credit_card_number: 10928309238)
    expect(order2).to_not be_valid
    end
    
    it "is not valid without a numerical total" do
    order2 = build(:order, total: 'hi.09')
    expect(order2).to_not be_valid
    end



end