json.array!(@orders) do |order|
  json.extract! order, :id, :order_number
  # json.url api_v1_order_url(order, format: :json)
  #the '.url' lets you set a custom key for this value.
end
