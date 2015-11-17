json.array!(@notifications) do |notification|
  json.extract! notification, :id, :created_by, :responded_by, :post_id, :post_type, :view_stat
  json.url notification_url(notification, format: :json)
end
