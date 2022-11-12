# frozen_string_literal: true

json.partial! 'api/v1/movements/movement', movement: @movement
json.partial! 'api/v1/movements/movementlogs', movementlogs: @movementlogs
