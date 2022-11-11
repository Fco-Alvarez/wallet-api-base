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

  validate :validate_different_user, on: :money_transfer
  validate :validate_sufficient_balance, on: :money_transfer

  scope :by_concept, -> concept { where( "concept LIKE ?", "%" + concept + "%" ) }
  scope :by_type, -> kind { where( "kind = ?", kind) }
  scope :by_account, -> account_id { where( "account_id = ?", account_id ) }

  private

  def validate_different_user
    errors.add(:user_id, 'No se puede enviarse dinero asi mismo.') if user_id == account.user_id
  end

  def validate_sufficient_balance
    errors.add(:amount, 'Saldo insuficiente.') if account.get_balance < amount
  end
end
