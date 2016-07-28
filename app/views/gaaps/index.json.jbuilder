json.array!(@gaaps) do |gaap|
  json.extract! gaap, :id, :name
  json.url gaap_url(gaap, format: :json)
end
