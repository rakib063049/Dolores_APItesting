json.array!(@time_logs) do |time_log|
  json.extract! time_log, :id, :start_at, :end_at, :idle_time, :user_id, :project_id
  json.url time_log_url(time_log, format: :json)
end
