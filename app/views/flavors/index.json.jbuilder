json.array!(@flavors) do |flavor|
  json.extract! flavor, :id, :name, :rating, :user_id, :beer_id
  json.url flavor_url(flavor, format: :json)
end
