require_relative '../validators/ars_currency_account_validator.rb'
# == Schema Information
#
# Table name: transactions
#
#  id         :bigint           not null, primary key
#  amount     :decimal(, )
#  concept    :string
#  date       :date
#  kind       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_transactions_on_account_id  (account_id)
#  index_transactions_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (user_id => users.id)
#
class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :user
  validates :kind, inclusion: { in: %w(topup payment),
                                message: "%{value} is not a valid type" }
  validates :account_id, presence: true, ars_currency_account: true, on: :create_from_controller

  scope :by_concept -> concept { where( "concept LIKE ?", "%" + concept + "%" ) }
  scope :by_type -> kind { where( "kind = ?", kind) }
  scope :by_account -> account_id { where( "account_id = ?", account_id ) }
end
