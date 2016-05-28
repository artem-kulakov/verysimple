json.array!(@reports) do |report|
  json.extract! report, :id, :company_id
  json.url report_url(report, format: :json)
end
