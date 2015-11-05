json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :description, :type, :createdate, :report
  json.url comment_url(comment, format: :json)
end
