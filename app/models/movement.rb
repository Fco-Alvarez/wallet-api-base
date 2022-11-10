require_relative '../validators/ars_currency_account_validator.rb'
require_relative '../validators/user_account_validator.rb'
# == Schema Information
#
# Table name: movements
#
#  id         :bigint           not null, primary key
#  amount     :decimal(, )
#  concept    :string
#  date       :date
#  kind       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_movements_on_account_id  (account_id)
#  index_movements_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (user_id => users.id)
#
class Movement < ApplicationRecord
  belongs_to :account
  belongs_to :user
  validates :kind, inclusion: { in: %w(topup payment),
                                message: "%{value} is not a valid type" }
  validates :account_id, presence: true, ars_currency_account: true, on: :create_from_controller
  validates_with UserAccountValidator, on: :create_from_controller

  scope :by_concept, -> concept { where( "concept LIKE ?", "%" + concept + "%" ) }
  scope :by_type, -> kind { where( "kind = ?", kind) }
  scope :by_account, -> account_id { where( "account_id = ?", account_id ) }
end