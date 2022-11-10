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
require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'Validations of the user model' do
    subject { build(:account) }

    it 'Validate if there is a relationship with user' do
      should belong_to(:user)
    end

    it 'Validate relationship with movements' do
      should have_many(:movements)
    end
  end
end
