# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  currency   :string
#  total      :decimal(, )      default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_accounts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Account < ApplicationRecord
  belongs_to :user
  has_many :movements

  validates :currency, inclusion: { in: %w[usd ars],
                                    message: '%<value>s is not a valid currency' }

  def get_balance
    user.account_difference(id)
  end
end
