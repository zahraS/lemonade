json.array!(@emotions) do |emotion|
  json.extract! emotion, :id, :page_id, :emotion_type
  json.url emotion_url(emotion, format: :json)
end
