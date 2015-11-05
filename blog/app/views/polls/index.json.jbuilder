json.array!(@polls) do |poll|
  json.extract! poll, :id, :user_id, :post_id, :interim, :finish_time, :anonimity, :vote_type, :community_id, :restricted_id
  json.url poll_url(poll, format: :json)
end
