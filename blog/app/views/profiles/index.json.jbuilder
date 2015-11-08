json.array!(@profiles) do |profile|
  json.extract! profile, :id, :firstName, :LastName, :gender, :DOB, :phone, :email, :verified, :verify_id, :inactive, :role_id, :community_id, :showPhone, :verifytime, :door_no
  json.url profile_url(profile, format: :json)
end
