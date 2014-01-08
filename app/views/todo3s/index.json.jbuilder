json.array!(@todo3s) do |todo3|
  json.extract! todo3, :id, :label
  json.url todo3_url(todo3, format: :json)
end
