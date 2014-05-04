json.array!(@pages) do |page|
  json.extract! page, :id, :published_at, :user_id
  json.url page_url(page, format: :json)
end
