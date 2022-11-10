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
require 'rails_helper'

RSpec.describe Movement, type: :model do
  describe 'Validations of the Movement model' do
    subject { build(:movement) }

    it 'Validate if there is a relationship with user' do
      should belong_to(:user)
    end

    it 'Validate if there is a relationship with user' do
      should belong_to(:account)
    end
  end
end
