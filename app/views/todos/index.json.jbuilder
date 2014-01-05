json.array!(@todos) do |todo|
  json.extract! todo, :id, :label, :summary
  json.url todo_url(todo, format: :json)
end
