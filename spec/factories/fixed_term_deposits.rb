# == Schema Information
#
# Table name: fixed_term_deposits
#
#  id            :bigint           not null, primary key
#  amount        :decimal(, )
#  closing_date  :date
#  creation_date :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :fixed_term_deposit do
    amount { "9.99" }
    creation_date { "2022-11-02" }
    closing_date { "2022-11-02" }
  end
end
