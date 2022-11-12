# frozen_string_literal: true

json.partial! 'api/v1/movements/movement', movement: @movement
if @movementlogs
  json.partial! 'api/v1/movements/movementlogs', movementlogs: @movementlogs
end
