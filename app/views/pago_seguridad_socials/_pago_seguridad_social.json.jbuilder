json.extract! pago_seguridad_social, :id, :valor, :comentario, :user_id, :persona_id, :created_at, :updated_at
json.url pago_seguridad_social_url(pago_seguridad_social, format: :json)
