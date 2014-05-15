json.array!(@birth_dates) do |birth_date|
  json.extract! birth_date, :id, :date, :title, :user_id
  json.url birth_date_url(birth_date, format: :json)
end
