# frozen_string_literal: true

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
  describe 'Validations of the Account model' do
    let(:new_account) { build(:account) }

    it 'Validate if there is a relationship with user' do
      expect(new_account).to belong_to(:user)
    end

    it 'Validate relationship with movements' do
      expect(new_account).to have_many(:movements)
    end
  end
end
