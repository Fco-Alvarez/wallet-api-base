# frozen_string_literal: true

# == Schema Information
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
require 'rails_helper'

RSpec.describe Movementlog, type: :model do
  it 'creates a movementlog when a movement is updated' do
    expect do
      new_user = create(:user)
      new_movement = create(:movement, user_id: new_user.id, amount: 100_000)
      new_movement.update(amount: rand(1.00..100_000.00))
    end.to change(described_class, :count).by(1)
  end
end
