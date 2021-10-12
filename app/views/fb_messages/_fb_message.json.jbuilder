json.extract! fb_message, :id, :received, :reply, :created_at, :updated_at
json.url fb_message_url(fb_message, format: :json)
