json.extract! accion, :id, :tipo_accion, :created_at, :updated_at
json.url accion_url(accion, format: :json)
