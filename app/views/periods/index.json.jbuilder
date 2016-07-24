json.array!(@periods) do |period|
  json.extract! period, :id, :ending
  json.url period_url(period, format: :json)
end
