json.array!(@yellowpages) do |yellowpage|
  json.extract! yellowpage, :id, :profile_id, :name, :phone, :address, :description, :verified, :community_id, :AveRating, :totalRatings
  json.url yellowpage_url(yellowpage, format: :json)
end
