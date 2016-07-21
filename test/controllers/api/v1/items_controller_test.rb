require 'test_helper'

class Api::V1::ItemsControllerTest < ActionDispatch::IntegrationTest
  test 'can get all items in index' do
    get '/api/v1/items.json'

    assert_response :success

    items = JSON.parse(response.body)

    assert_equal 2, items.count
  end

  test 'can get a single item' do
    item = items(:one)

    get "/api/v1/items/#{item.id}"

    assert_response :success

    parsed_item = JSON.parse(response.body)

    assert_equal "Hammer", parsed_item["name"]
    assert_equal "When it is this time, you stop.", parsed_item["description"]
  end

  test 'can create a new item' do
    item_params = { name: "Saw", description: "Used for lumber" }

    post '/api/v1/items.json', params: { item: item_params }

    assert_response :success

    parsed_item = JSON.parse(response.body)

    item = Item.last

    assert_equal item.id, parsed_item['id']
    assert_equal item_params[:name], parsed_item['name']
    assert_equal item_params[:description], parsed_item['description']
  end

  test 'can update an item' do
    item = items(:two)

    item_params = {item: {name: "Drill", description: "A holey machine"}}

    put "/api/v1/items/#{item.id}", params:  item_params

    assert_response :success

    parsed_item = JSON.parse(response.body)
    changed_item = Item.find(item.id)

    assert_equal changed_item.id, parsed_item['id']
    assert_equal changed_item.name, parsed_item['name']
    assert_equal changed_item.description, parsed_item['description']
  end
end
