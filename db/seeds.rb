require 'faker'

user1 = User.create(
          email: Faker::Internet.email,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          password: 'password',
          rol: ['admin', 'regular'].sample
        )

user2 = User.create(
          email: Faker::Internet.email,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          password: 'password',
          rol: ['admin', 'regular'].sample
        )

user3 = User.create(
          email: Faker::Internet.email,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          password: 'password',
          rol: ['admin', 'regular'].sample
        )


Account.create(
  user: user1,
  currency: 'usd'
)

Account.create(
  user: user1,
  currency: 'ars'
)

Account.create(
  user: user2,
  currency: 'usd'
)

Account.create(
  user: user2,
  currency: 'ars'
)

Account.create(
  user: user3,
  currency: 'usd'
)
Account.create(
  user: user3,
  currency: 'ars'
)

[user1, user2, user3].each do |user|
  user.accounts.each do |account|
    (2..6).to_a.sample.times do
      Transaction.create(
        kind: ['topup', 'payment'].sample,
        amount: Faker::Number.decimal(l_digits: 3, r_digits: 2),
        concept: Faker::Lorem.word,
        date: Faker::Date.birthday(min_age: 0, max_age: 5),
        user: user,
        account: account
      )
    end

  end
end
