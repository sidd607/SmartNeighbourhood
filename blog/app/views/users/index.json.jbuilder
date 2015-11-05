json.array!(@users) do |user|
  json.extract! user, :id, :firstName, :LastName, :gender, :DOB, :phone, :email, :verified, :verify_id, :inactive, :role_id, :community_id, :showPhone, :verifytime, :door_no
  json.url user_url(user, format: :json)
end
