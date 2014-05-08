json.array!(@projects) do |project|
  json.extract! project, :id, :project_name, :project_number, :customer_id, :contact_id, :start_date, :end_date, :notes
  json.url project_url(project, format: :json)
end
