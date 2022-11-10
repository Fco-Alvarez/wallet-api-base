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
FactoryBot.define do
  factory :refund_request do
    concept { "MyString" }
    state { "MyString" }
    movement { nil }
  end
end
