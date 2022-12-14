# frozen_string_literal: true

# == Schema
# Information
#
# Table name: movementlogs
#
#  id          :bigint           not null, primary key
#  amount      :decimal(, )
#  kind        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  movement_id :bigint           not null
#
# Indexes
#
#  index_movementlogs_on_movement_id  (movement_id)
#
# Foreign Keys
#
#  fk_rails_...  (movement_id => movements.id)
#
class Movementlog < ApplicationRecord
  belongs_to :movement
end
