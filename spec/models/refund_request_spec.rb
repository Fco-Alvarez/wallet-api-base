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
require 'rails_helper'

RSpec.describe RefundRequest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
