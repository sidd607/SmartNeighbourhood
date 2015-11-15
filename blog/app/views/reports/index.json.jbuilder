json.array!(@reports) do |report|
  json.extract! report, :id, :profile_id, :post_id, :type, :profile_id, :reason, :reported_at
  json.url report_url(report, format: :json)
end
