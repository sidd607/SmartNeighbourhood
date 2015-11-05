json.array!(@authenticates) do |authenticate|
  json.extract! authenticate, :id, :email, :password
  json.url authenticate_url(authenticate, format: :json)
end
