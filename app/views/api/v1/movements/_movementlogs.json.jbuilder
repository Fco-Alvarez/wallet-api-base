# frozen_string_literal: true

json.movementlogs movementlogs do | movementlog |
  json.movement_id movementlog.movement_id
  json.kind movementlog.kind
  json.amount movementlog.amount
  json.created_at movementlog.created_at
end
