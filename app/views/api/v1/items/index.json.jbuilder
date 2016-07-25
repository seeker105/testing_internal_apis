json.array!(@items) do |item|
  json.extract! item, :id, :item_number
  # json.url api_v1_item_url(item, format: :json)
  #the '.url' lets you set a custom key for this value.
end
