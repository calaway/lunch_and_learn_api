require 'rails_helper'

describe 'Items API' do
  it 'returns a list of items' do
    3.times do |n|
      Item.create(name: "item_#{n}", description: "description of item #{n}")
    end

    get '/api/v1/items'
    items = JSON.parse(response.body)

    assert_response 200
    expect(items.count).to eq 3
  end

  it 'returns one item by id' do
    3.times do |n|
      Item.create(name: "item_#{n}", description: "description of item #{n}")
    end

    id = Item.last.id

    get "/api/v1/items/#{id}"
    item = JSON.parse(response.body)

    assert_response 200
    expect(item['name']).to eq 'item_2'
    expect(item['description']).to eq 'description of item 2'
  end

  it 'creates a new item' do
    post '/api/v1/items', params: {name: 'guacamole', description: 'green snack'}
    item = JSON.parse(response.body)

    assert_response 200
    expect(item['name']).to eq 'guacamole'
    expect(item['description']).to eq 'green snack'
  end

  it 'updates an item' do
    new_item = Item.create(name: 'original name', description: 'original description')

    put "/api/v1/items/#{new_item.id}", params: {name: 'updated name', description: 'updated description'}
    item = JSON.parse(response.body)

    assert_response 200
    expect(item['name']).to eq 'updated name'
    expect(item['description']).to eq 'updated description'
  end

  it 'deletes an item' do
    3.times do |n|
      Item.create(name: "item_#{n}", description: "description of item #{n}")
    end
    id = Item.last.id

    expect { delete "/api/v1/items/#{id}" }.to change{ Item.count }.from(3).to(2)

    expect(Item.last['name']).to eq('item_1')
  end
end
