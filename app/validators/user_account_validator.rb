class UserAccountValidator < ActiveModel::Validator
  def validate(record)
    unless record.user_id == Account.find(record.account_id).user_id
      record.errors.add :base, "Invalid account."
    end
  end
end