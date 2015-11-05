json.array!(@polloptions) do |polloption|
  json.extract! polloption, :id, :poll_id, :option, :description, :votecount
  json.url polloption_url(polloption, format: :json)
end
