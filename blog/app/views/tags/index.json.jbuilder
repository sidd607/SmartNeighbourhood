json.array!(@tags) do |tag|
  json.extract! tag, :id, :name, :post_id, :user_id, :type
  json.url tag_url(tag, format: :json)
end
