json.array!(@polls) do |poll|
  json.extract! poll, :id, :profile_id, :post_id, :options, :user_response, :interim, :finish_time, :anonimity, :vote_type, :community_id, :restricted_id
  json.url poll_url(poll, format: :json)
end
