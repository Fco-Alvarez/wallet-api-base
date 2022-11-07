# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  rol             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  require "securerandom"
  has_secure_password

  has_many :transactions
  has_many :accounts
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid email" }
  validates :rol, inclusion: { in: %w(admin regular),
                               message: "%{value} is not a valid rol" }
  validates :password, presence: true, length: { minimum: 6 }
  
  def account_by_currency(currency) 
    accounts.where("currency = ?", currency).first
  end

  def account_balance(currency)
    account = account_by_currency(currency)
    difference(account.id)
  end

  def difference(account_id)
    transactions.by_account(account_id).by_type('topup').sum(:amount) - transactions.by_account(account_id).by_type('payment').sum(:amount)
  end
end
