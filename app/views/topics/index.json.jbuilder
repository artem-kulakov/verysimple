json.array!(@topics) do |topic|
  json.extract! topic, :id, :user_id, :title, :body
  json.url topic_url(topic, format: :json)
end
