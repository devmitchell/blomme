json.array!(@issues) do |issue|
  json.extract! issue, :id, :statement, :acknowledged
  json.url issue_url(issue, format: :json)
end
