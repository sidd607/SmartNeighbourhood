json.array!(@communities) do |community|
  json.extract! community, :id, :pincode, :city, :state, :country
  json.url community_url(community, format: :json)
end
