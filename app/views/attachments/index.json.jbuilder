json.array!(@attachments) do |attachment|
  json.extract! attachment, :id, :position, :user_id
  json.url attachment_url(attachment, format: :json)
end
