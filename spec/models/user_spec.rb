# frozen_string_literal: true

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
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations of the user model' do
    let(:new_user) { build(:user) }

    it 'validate if the email is present' do
      expect(new_user).to validate_presence_of(:email)
    end

    it 'validate if the email is unique' do
      expect(new_user).to validate_uniqueness_of(:email)
    end

    it 'validate that it does not accept incorrect emails' do
      expect(new_user).not_to allow_value('test').for(:email)
    end

    it 'validate if the password is present' do
      expect(new_user).to validate_presence_of(:password)
    end

    it 'validate if it has at least six characters' do
      expect(new_user).to validate_length_of(:password).is_at_least(6)
    end

    it 'Validate relationship with movements' do
      expect(new_user).to have_many(:movements)
    end

    it 'Validate relationship with accounts' do
      expect(new_user).to have_many(:accounts)
    end
  end
end
