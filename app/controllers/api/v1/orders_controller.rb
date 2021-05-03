class Api::V1::OrdersController < ApplicationController

    # POST /api/magic
    def create 
        # create an instance of an order, manually set attributes to destructure payment details and flatten data 
        @order = Order.new(email: order_params["email"], quantity: order_params["quantity"], total: order_params["total"], credit_card_number: order_params["payment"]["credit_card_number"], credit_card_exp: order_params["payment"]["credit_card_exp"])
        # save the data --> if successful return unique order id, success message and created status
        if @order.save
        render json: {id: @order.id, message: "Your order has been placed!"}, :status => :created
        else
        # if failed --> capture the errors, format them to a message and send both to frontend to render / update user + form input Ui
        errors = @order.errors.messages
        message = errors.map{|k,v| "#{v[0]}."}.join(" ")
        
        render json: {error: errors, message: message}, status: :unprocessable_entity, message: "Already Exists"
    
        end
    end
    
    private    
    # set strong params for order instance
    def order_params
        params.require(:order).permit(:email, :quantity, :total, payment: {})
    end
    
end
    