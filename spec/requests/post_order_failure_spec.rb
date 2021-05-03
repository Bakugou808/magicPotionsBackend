require 'rails_helper'

describe "post order route: fail", :type => :request do
    before do
        @order1 = create(:order, :email => "casadojo718@gmail.com")
        post '/api/v1/api/magic', params: {:order => { :email => "casadojo718@gmail.com", :quantity => 2, :total => 99.98, :payment => {:credit_card_number => "1234098712340987", :credit_card_exp => '04/20'}}}
      end
      
    it 'returns the error: Order Already Exists' do
        expect(JSON.parse(response.body)['error']['email'][0]).to eq("Order Already Exists")
    end

    it 'returns 422 status code' do
        expect(response.status).to eq(422)
    end
      
end