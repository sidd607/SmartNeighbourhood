json.array!(@posts) do |post|
  json.extract! post, :id, :community_id, :profile_id, :title, :body, :create_date, :update_date, :type, :priority, :report, :rating, :rateCount
  json.url post_url(post, format: :json)
end
