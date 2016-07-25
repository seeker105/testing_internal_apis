class Api::V1::OrdersController < ApplicationController
  def index
    render json: Order.all #, each_serializer: SomeCustomOrderSerializer
          #you have to use 'each_serializer' when returning a collection
  end

  def show
    render json: Order.find(params[:id]), serializer: FullOrderSerializer
  end
end
