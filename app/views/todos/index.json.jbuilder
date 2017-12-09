json.array!(@todos) do |todo|
  json.extract! todo, :id, :name, :notes, :project_id
  json.url todo_url(todo, format: :json)
end
