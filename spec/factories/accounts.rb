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
FactoryBot.define do
  factory :account do
    currency { "MyString" }
    user { nil }
  end
end
