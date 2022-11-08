# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  currency   :string
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
  validates :currency, inclusion: { in: %w(usd ars),
                                    message: "%{value} is not a valid currency" }

  # def update_total!
  #   self.update(total: self.get_total)
  # end

  def get_balance
    self.user.difference(self.id)
  end

  # def difference(account_id)
  #   transactions.by_account(account_id).by_type('topup').sum(:amount) - transactions.by_account(account_id).by_type('payment').sum(:amount)
  # end
  # def get_total
  #   Product.joins(:shopping_cart_products)
  #   .where(shopping_cart_products: { shopping_cart_id: self.id })
  #   .select('SUM(products.price * shopping_cart_products.quantity) AS t')[0].t
  # end
end
