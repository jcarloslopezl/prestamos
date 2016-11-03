json.extract! requisition, :id, :user_id, :created_at, :updated_at
json.url requisition_url(requisition, format: :json)