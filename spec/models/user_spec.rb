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

  describe 'CRUD accounts' do
    let(:new_user) { create(:user) }

    it 'creates a user' do
      expect do
        create(:user)
      end.to change(described_class, :count).by(1)
    end

    it 'creates accounts (ars, usd) when creates a user' do
      accounts = Account.where(user_id: new_user)
      expect(accounts.count).to eq(2)
    end

    it 'updates a user' do
      update_email = 'test_email@email.com'
      new_user.update(email: update_email)
      expect(new_user.email).to match(update_email)
    end

    it 'destroys a user' do
      user = new_user
      expect do
        user.destroy
      end.to change(described_class, :count).by(-1)
    end

    it 'does not create a user if email is already taken' do
      email = new_user.email
      expect do
        create(:user, email: email)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'does not create a user if password is empty' do
      password = ''
      expect do
        create(:user, password: password)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'validates if user has a rol' do
      expect(new_user.rol).not_to eq('')
    end

    it 'validates if user is admin or regular' do
      expect(new_user.rol).to match('regular').or match('admin')
    end

    it 'raise error if user is not admin or regular' do
      expect do
        create(:user, rol: 'dog')
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
