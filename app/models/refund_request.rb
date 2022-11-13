# frozen_string_literal: true

# == Schema Information
#
# Table name: refund_requests
#
#  id          :bigint           not null, primary key
#  concept     :string
#  state       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  movement_id :bigint           not null
#
# Indexes
#
#  index_refund_requests_on_movement_id  (movement_id)
#
# Foreign Keys
#
#  fk_rails_...  (movement_id => movements.id)
#
class RefundRequest < ApplicationRecord
  belongs_to :movement
  validates :state, inclusion: { in: %w[pending refunded rejected cancelled],
                                 message: '%<value>s is not a valid state' }
end
