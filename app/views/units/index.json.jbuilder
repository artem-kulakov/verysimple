json.array!(@units) do |unit|
  json.extract! unit, :id, :name, :section_id, :type_id
  json.url unit_url(unit, format: :json)
end
