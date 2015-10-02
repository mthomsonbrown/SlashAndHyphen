json.array!(@beers) do |beer|
  json.extract! beer, :id, :name, :abv, :user_id
  json.url beer_url(beer, format: :json)
end
