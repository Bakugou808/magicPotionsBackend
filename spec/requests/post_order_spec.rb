require 'rails_helper'

describe "post order route: success", :type => :request do
    before do
        post '/api/v1/api/magic', params: {:order => { :email => "testing@gmail.com", :quantity => 2, :total => 99.98, :payment => {:credit_card_number => "1234098712340987", :credit_card_exp => '04/20'}}}
      end
    it 'returns the order id' do
        expect(JSON.parse(response.body)['id']).to eq(Order.last.id)
    end
    it 'returns :created response' do
        expect(response).to have_http_status(:created)
    end

    it 'returns 201 status code' do
        expect(response.status).to eq(201)
    end
      
end

