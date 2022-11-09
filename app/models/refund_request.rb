# == Schema Information
#
# Table name: refund_requests
#
#  id             :bigint           not null, primary key
#  concept        :string
#  state          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  transaction_id :bigint           not null
#
# Indexes
#
#  index_refund_requests_on_transaction_id  (transaction_id)
#
# Foreign Keys
#
#  fk_rails_...  (transaction_id => transactions.id)
#
class RefundRequest < ApplicationRecord
  belongs_to :transaction
end
