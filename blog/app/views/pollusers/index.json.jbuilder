json.array!(@pollusers) do |polluser|
  json.extract! polluser, :id, :poll_id, :user_id, :optionSelected
  json.url polluser_url(polluser, format: :json)
end
