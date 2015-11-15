json.array!(@ratings) do |rating|
  json.extract! rating, :id, :post_id, :profile_id, :rate, :rated_at, :type, :Description
  json.url rating_url(rating, format: :json)
end
